'use strict';

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; // Types

// Components

// Mixins


var _mixins = require('../../util/mixins');

var _mixins2 = _interopRequireDefault(_mixins);

var _VIcon = require('../VIcon');

var _VIcon2 = _interopRequireDefault(_VIcon);

var _themeable = require('../../mixins/themeable');

var _themeable2 = _interopRequireDefault(_themeable);

var _colorable = require('../../mixins/colorable');

var _colorable2 = _interopRequireDefault(_colorable);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

exports.default = (0, _mixins2.default)(_colorable2.default, _themeable2.default
/* @vue/component */
).extend({
    name: 'v-timeline-item',
    props: {
        color: {
            type: String,
            default: 'primary'
        },
        fillDot: Boolean,
        hideDot: Boolean,
        icon: String,
        iconColor: String,
        large: Boolean,
        left: Boolean,
        right: Boolean,
        small: Boolean
    },
    computed: {
        hasIcon: function hasIcon() {
            return !!this.icon || !!this.$slots.icon;
        }
    },
    methods: {
        genBody: function genBody() {
            return this.$createElement('div', {
                staticClass: 'v-timeline-item__body'
            }, this.$slots.default);
        },
        genIcon: function genIcon() {
            if (this.$slots.icon) {
                return this.$slots.icon;
            }
            return this.$createElement(_VIcon2.default, {
                props: {
                    color: this.iconColor,
                    dark: !this.theme.isDark,
                    small: this.small
                }
            }, this.icon);
        },
        genInnerDot: function genInnerDot() {
            var data = this.setBackgroundColor(this.color);
            return this.$createElement('div', _extends({
                staticClass: 'v-timeline-item__inner-dot'
            }, data), [this.hasIcon && this.genIcon()]);
        },
        genDot: function genDot() {
            return this.$createElement('div', {
                staticClass: 'v-timeline-item__dot',
                class: {
                    'v-timeline-item__dot--small': this.small,
                    'v-timeline-item__dot--large': this.large
                }
            }, [this.genInnerDot()]);
        },
        genOpposite: function genOpposite() {
            return this.$createElement('div', {
                staticClass: 'v-timeline-item__opposite'
            }, this.$slots.opposite);
        }
    },
    render: function render(h) {
        var children = [this.genBody()];
        if (!this.hideDot) children.unshift(this.genDot());
        if (this.$slots.opposite) children.push(this.genOpposite());
        return h('div', {
            staticClass: 'v-timeline-item',
            class: _extends({
                'v-timeline-item--fill-dot': this.fillDot,
                'v-timeline-item--left': this.left,
                'v-timeline-item--right': this.right
            }, this.themeClasses)
        }, children);
    }
});
//# sourceMappingURL=VTimelineItem.js.map