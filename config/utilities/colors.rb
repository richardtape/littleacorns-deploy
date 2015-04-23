# Helper functions for colorizing our text output on the console
# usage: colorize( 'Message text in red', "\e[31m" );
def colorize( text, color_code )

	"#{color_code}#{text}\e[0m"

end

# Extra helper functions for specific colours
# Usage: yellow( 'Some text that will be yellow' );
def red( text ); colorize( text, "\e[31m" ); end
def green( text ); colorize( text, "\e[32m" ); end
def blue( text ); colorize( text, "\e[34m" ); end
def yellow( text ); colorize( text, "\e[33m" ); end