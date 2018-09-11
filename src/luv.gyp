{
  'variables': {
    'target_arch%': 'x64'
  },
  'target_defaults': {
    'default_configuration': 'Release',
    'configurations': {
      'Debug': {
        'defines': [ 'DEBUG', '_DEBUG' ],
        'msvs_settings': {
          'VCCLCompilerTool': {
            'RuntimeLibrary': 1, # static debug
          },
        },
      },
      'Release': {
        'defines': [ 'NDEBUG' ],
        'msvs_settings': {
          'VCCLCompilerTool': {
            'RuntimeLibrary': 0, # static release
          },
        },
      }
    },
    'msvs_settings': {
      'VCLinkerTool': {
        'GenerateDebugInformation': 'true',
      },
    },
    'include_dirs': [
      #'src'
     ],

    'conditions' : [
        ['OS=="linux"', {
        }],
        ['OS=="mac"', {
        }],
        ['OS=="win"', {
          'defines':[
            'WIN32_LEAN_AND_MEAN'
          ],
          'msvs_settings': {
            'VCCLCompilerTool': {
              'AdditionalOptions': [ '/EHsc /MD' ],
            },
          }
        }]
    ],
   },

  'targets': [
    {
      'target_name': 'libluv',
      'type': 'static_library',
      'dependencies': [  '../lua/lua.gyp:liblua', '../libuv/uv.gyp:libuv' ],
      'sources': [
        'luv.c',
        'luv_cond.c',
        'luv_state.c',
        'luv_fiber.c',
        'luv_thread.c',
        'luv_codec.c',
        'luv_object.c',
        'luv_timer.c',
        'luv_idle.c',
        'luv_fs.c',
        'luv_stream.c',
        'luv_pipe.c',
        'luv_net.c',
        'luv_process.c'
      ]
    }
  ]
}