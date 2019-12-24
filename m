Return-Path: <jailhouse-dev+bncBCB7D7MXMMIPFRMH6ACRUBDYIJXPC@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A9129FF3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 11:05:40 +0100 (CET)
Received: by mail-oi1-x238.google.com with SMTP id m127sf6168315oig.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 02:05:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577181938; cv=pass;
        d=google.com; s=arc-20160816;
        b=w4XgTXFvrnx1MWN2dkvlmulZeAuMSIGF/TS1nPHdQUNTofgwOB6ve0qCqcjlLU651M
         2fvoRbX6GeO0ZgxUXlgD8fK6aXHPH5vQw1BUHnEWjR8Zy2uLPYjUXdjOtJpBzTNr6EYK
         81ISSkdu2CHq4+REeAl8Yz7VJlFDXmJCMn7Oj5cksjGXo/wz39jfU7IbU0Q7CLJeE1F9
         fppFNdexjg3WCTlQ+XOKKCZCbiD4EsSe6fF3eU56SvkJ9CQBuJjQLnow8gGbqb4F0ozg
         Z8X88vIJGvnuncP6p1cMo2Xn4bf6c7UG+D4Wcq4mU7H6i77O2MbD6oavXyyPvFbZf+wc
         bjpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=dch0kn1Psg4w75ubkABvP40BYrupz2qt3TrquTATJ9I=;
        b=IYbSCS912aomg7dwCu1pFJTwvtlNSFA3rWT2NJt0uQouPCBxKA7wcxFIQNx0e/Wzjy
         4kIPpQn5WbhCx272/sDQLCBdjt8FeHUtzWPPoqSwW6Bq8S8oxCXaV4kUfgFIxLXgaRr2
         y19ExJGvbswNLQaBwupJwB9w6pY0QAxdxO8TiymqaMQ3j/mfMYVNtKYKbC/jxo8hEylQ
         AawUoIM+KF7sAF1anfWm/U9oySF67NCLOMIBtbyNPnCCDGeLjcQaPKbxTQBXGPWVOzOU
         deVTMTvzncQ+8oH1rswhQc1ObS0D9iiB/D0jV4Q3NphSWfalBW/q949YtQT3hcdtXtyf
         R0WQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fs4b3t9c;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=dch0kn1Psg4w75ubkABvP40BYrupz2qt3TrquTATJ9I=;
        b=Hkj5d/sOWDUZN8qe1RGQezWokCrSGUOeBhckGDtvicvSPpG218eYe12bOZnRUX4kPr
         k2bBhBO5ZtGhMU4EWUw8yh9hkKZ6wsNCo1ISwAwAdAAPKcTTLJlE8wd6y+AyuojLtogf
         aCe/+bkOCABk170Doy24y93rkM7xCHlu2tDhiYQVu9Fnr5fwuIB2db1VOGHbOTCDhBwT
         zE84K+uQGffKwOuAgwZ2TlPtIcW8QxWkY9EscLff98u3OfEtr2hdwUmvWnep7FPNH4y7
         S7VsbNSPzwkbPVwwhW45M18DCufSKvTHdf/AtsX4b7yEYxBS9qtigVvpI8TqFA8LUcm/
         MGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dch0kn1Psg4w75ubkABvP40BYrupz2qt3TrquTATJ9I=;
        b=i9O9ik1Do7+lwpuXzUGu+rO0pdSjoW1+0T6SWTCvN0JM0emKWID2ohw9vQI/VgIbQq
         mt97E3gD/XeL6A5/5wiP5T67TZbKAmpEXmSsnt+7c1I93LhJ/yA3r+m41miGG7jSM928
         4C8YEAdrmfNaYGwfHb3u1B2Ul08kkEe9Ky287eL65F7OcYU9bsJnFeSFNBR5sGFlWoYf
         MICBi/yFo+6w1sPy5jPPP3lHfYMjjfqiTTU8YgdL+7j6OuugjFeEAcydjYUT5JJagun+
         LyO85qwcTqDpGIw6TDmHm4D572F9XXNTOQipUJJlKNCSRH4TwG2rrv0yJXvILf3zpFEB
         PXPw==
X-Gm-Message-State: APjAAAVfvO7USBdPS8I8X/PXqPFnlPxMgsHsJ/iCBCvtW56l4XrLCODw
	m2bg1avKz52FuX4nl2NhOyE=
X-Google-Smtp-Source: APXvYqx1kFv0Zx+JvicO0ZjlloRAvlFOJ1dSKYg3XeBJCCxcn/CkklH/y/KXAMl5ZBgYSRRPgLyfHg==
X-Received: by 2002:a9d:ec1:: with SMTP id 59mr35585562otj.141.1577181938725;
        Tue, 24 Dec 2019 02:05:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:469a:: with SMTP id z26ls3817681ote.8.gmail; Tue, 24 Dec
 2019 02:05:38 -0800 (PST)
X-Received: by 2002:a9d:6d10:: with SMTP id o16mr38712519otp.28.1577181938294;
        Tue, 24 Dec 2019 02:05:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577181938; cv=none;
        d=google.com; s=arc-20160816;
        b=dTzzYf2h1UHRaIED1JPxUUM0460HsQYd6Dqo2Kge2PvxUUwtyKVGJuR9lG0Nq7Z1eW
         0kjpB0a5tfZpAsXFMokG6U1C9/tPkIkbDPq7cTjOF5ZBPwMogTrYJuIX1jpSC9fg6Dl+
         Qys7txliSyhUpE61f2+xO2+cDuLgil8MQnAIHkKPLJIGFPfzMhMYNGWPDz5eNHwL5ed+
         mATNhD4tLVNO5M2PAu5W3LXbxPb8BWYJgFX/kXPz4nEXecb+6vVUvCBGVuiN1YW1lmnL
         Cz/BxrLy1hfwdA7Sq25Of/PxgGFifd0qs9tAhPB2mVyZV40m02b7ygCa6N6WsF5pAOL/
         piSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=0ulDfCl/FTyuD2iS+RWFygK0tIoxT4hjYJSMq3kzvrk=;
        b=A9aRgX5oQ2juVJmxdZ0R8gA/D8tywQRFFbpIn+HVvYHb1jj+ejylZiCkHg/SqYtBBI
         Y3WnTjDPviGnD1d7T5lWZYw+YrjoEutxA6n7FxMBStEwIFs2QfBSCqOAizMj4NVQTunN
         JkZHw+EcpcNOqz0sFTcnCgy00J9093RPFzuKcvjqWrE/uKZS5cKJRNEmz1Vm0hSBRxKv
         GBOr8+BvBkSggHn3CgBtzk69BuuGLyyNPzF/0dLT6eL70vS5QCc2BcJQSX5jJ6EkwTeb
         ORPH47AsL6lp1IXzN+L4ok5OGgTzw0UHuYFbYyLVTSOQgxAvtZCIofI3gs2eUX+CF+6S
         2DfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fs4b3t9c;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d16si620662oij.1.2019.12.24.02.05.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Dec 2019 02:05:38 -0800 (PST)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBOA5bZL084564;
	Tue, 24 Dec 2019 04:05:37 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBOA5bcl119266;
	Tue, 24 Dec 2019 04:05:37 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Dec 2019 04:05:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Dec 2019 04:05:37 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBOA5Z0s091086;
	Tue, 24 Dec 2019 04:05:36 -0600
Subject: Re: [PATCH v4 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
 <20191223151353.22495-5-nikhil.nd@ti.com>
 <815ba243-8534-764d-1895-dbcf403a8a2d@ti.com>
 <3769aa5c-e0a0-aaca-3783-f273be67de2a@ti.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <ce04ee19-d469-371e-c9b2-1e6d1d69a8b0@ti.com>
Date: Tue, 24 Dec 2019 15:34:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3769aa5c-e0a0-aaca-3783-f273be67de2a@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Fs4b3t9c;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>



On 24/12/19 3:18 PM, Nikhil Devshatwar wrote:
> 
> 
> On 24/12/19 9:42 am, Lokesh Vutla wrote:
>> On 23/12/19 8:43 PM, Nikhil Devshatwar wrote:
>>> Add the linux demo cell config for j721e-evm board.
>>> Also add the required device tree for booting Linux kernel
>>> in the inmate cell.
>>>
>>> This cell config acts as a reference for partitioning
>>> devices across the 2 Linux cells.
>>> This will be updated as support for more devices get added.
>>>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>
>>> Notes:
>>>     Changes from v3:
>>>     * Add gpio, emmc and USB device in the DTS with upstream bindings
>>>     * Describe the irqmap for easy understanding and verification
>>>     * Update power-domains properties
>>>     
>>>     Changes from v2:
>>>     * Only add the DT entries for devices with stable bindings
>>>     * Organize the DTS to match the bus topology with upstream kernel
>>>     
>>>     Changes from v1:
>>>     * Split up the peripheral mem_region to match with kernel dts
>>>     * Add GPU, multimedia decoder and display devices
>>>
>>>  configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
>>>  configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
>>>  2 files changed, 695 insertions(+)
>>>  create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>>>  create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
>>>
>>> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
>>> new file mode 100644
>>> index 00000000..51470a57
>>> --- /dev/null
>>> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
>>> @@ -0,0 +1,433 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Device Tree Source for J721E Jailhouse inmate kernel
>>> + *
>>> + * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
>>> + */
>>> +
>>> +/dts-v1/;
>>> + surprised how they can 
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/pinctrl/k3.h>
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
>>> +
>>> +/ {
>>> +	model = "Texas Instruments J721E Inmate Model";
>>> +	compatible = "ti,j721e-evm", "ti,j721e";
>>> +	interrupt-parent = <&gic500>;
>>> +	#address-cells = <2>;
>>> +	#size-cells = <2>;
>>> +
>>> +	aliases {
>>> +		serial3 = &main_uart1;
>>> +	};
>>> +
>>> +	chosen {
>>> +		stdout-path = "serial3:115200n8";
>>> +	};
>>> +
>>> +	hypervisor {
>>> +		compatible = "jailhouse,cell";
>>> +	};
>>> +
>> [..snip..]
>>
>>> +
>>> +	cbass_main_navss: interconnect0 {
>>> +		compatible = "simple-bus";
>>> +		#address-cells = <2>;
>>> +		#size-cells = <2>;
>>> +		ranges;
>>> +
>>> +		main_navss_intr: interrupt-controller1 {
>>> +			compatible = "ti,sci-intr";
>>> +			ti,intr-trigger-type = <4>;
>>> +			interrupt-controller;
>>> +			interrupt-parent = <&gic500>;
>>> +			#interrupt-cells = <2>;
>>> +			ti,sci = <&dmsc>;
>>> +			ti,sci-dst-id = <14>;
>>> +			ti,sci-rm-range-girq = <4>;
>>> +		};
>>> +
>>> +		main_udmass_inta: interrupt-controller@33d00000 {
>>> +			compatible = "ti,sci-inta";
>>> +			reg = <0x0 0x33d00000 0x0 0x100000>;
>>> +			interrupt-controller;
>>> +			interrupt-parent = <&main_navss_intr>;
>>> +			msi-controller;
>>> +			ti,sci = <&dmsc>;
>>> +			ti,sci-dev-id = <209>;
>>> +			ti,sci-rm-range-vint = <0xa>;
>>> +			ti,sci-rm-range-global-event = <0xd>;
>>> +		};
>> You should drop this node. The address is not mapped in
>> k3-j721e-evm-linux-demo.c and there are no users in this DT. You should be very
>> careful when virtualizing inta and udmass.
> I am waiting for mcasp bindings to be supported in mainline kernel.
> Once it is done, we will start using UDMA, inta, intr from linux-demo cell
> 
>>> +	};
>>> +
>>> +	secure_proxy_main: mailbox@32c00000 {
>>> +		compatible = "ti,am654-secure-proxy";
>>> +		#mbox-cells = <1>;
>>> +		reg-names = "target_data", "rt", "scfg";
>>> +		reg = <0x00 0x32c00000 0x00 0x100000>,
>>> +		      <0x00 0x32400000 0x00 0x100000>,
>>> +		      <0x00 0x32800000 0x00 0x100000>;
>>> +		interrupt-names = "rx_016";
>>> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>>> +	};
>>> +
>> [..snip..]
>>
>>> +
>>> +/ {
>>> +
>>> +	gpio-keys {
>>> +		compatible = "gpio-keys";
>>> +		autorepeat;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&sw10_button_pins_default>;
>>> +
>>> +		sw10 {
>>> +			label = "GPIO Key USER1";
>>> +			linux,code = <BTN_0>;
>>> +			gpios = <&main_gpio2 0 GPIO_ACTIVE_LOW>;
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +&main_pmx0 {
>>> +	sw10_button_pins_default: sw10_button_pins_default {
>>> +		pinctrl-single,pins = <
>>> +			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
>> hmm..is this working? IIRC GPIO group should be selected along with mux mode,
>> else it will be routed to GPIO0.
> Good catch. Since many configs are not enabled in mainline kernel, I missed
> these failures.
> I enabled the configs an it is failing. I shall send the fixes separately now
> that the series is merged in next

Jan,
	What do you prefer?

Thanks and regards,
Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ce04ee19-d469-371e-c9b2-1e6d1d69a8b0%40ti.com.
