Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB6V5Q7YAKGQEVVGLMXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3f.google.com (mail-vk1-xa3f.google.com [IPv6:2607:f8b0:4864:20::a3f])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BF129FCF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 10:48:43 +0100 (CET)
Received: by mail-vk1-xa3f.google.com with SMTP id l4sf7660017vkn.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 01:48:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577180922; cv=pass;
        d=google.com; s=arc-20160816;
        b=udffMy/TyCfLiKhrq/wqdjSbNQh543vEQTKlU8SlObA+zQy2TB6mOgcXz35TfoBzUk
         4/dqLaVDVgAf8kUa0I5U95XtVOdSvB5yCfJVdzC7H6dWcsh19BosmjNSA6AfaVhSTjGj
         4dnSGC8f8fHs9jiyTeU2E5MigfvvMvU2Wy1C4ItZUtdOyDKXzDW/bSORUx7Ch848EAFB
         rWKC+klYUPmR9tdoGsYWoidqh6oBrb80jgYrFEiXXkhzXQwfd9h9o3ffE2qjaoeI1YGj
         WBssPn+YS2LOzvlKdR0Kav5ttxU8rDNy/OwQEF/4+j9K9jvckLRQ6BaLL425k+V781G/
         hxBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=/y5zcCfwVrX+OUOaWHhqyrx52HnQ+exGmrmAcBqDHDo=;
        b=SuLQ7cQW1Md6Hj13H61AziYJRuoPMpfk22mckeB7nuu7IcJmNrFlLmY5p44D9zXnZ6
         PV/CHDWdkeulE6X9PNcwAy7bLRe5ejf2DDuhC2Fmn+K6G8KD6arwli1EWmy7zJYz5uNv
         WWnt9lC1qyCbCJI3ohIKbEmNlWGkOZsrAsPSC02PKmLF9ZywYNqhkzA6DXZyyK8uEkSS
         VAt1uNyd8uyIYY4AnYRnFtAnOXAYNTQ4bFgh0iUqsTZ/uK5pH4rbSYoouj1rJNkMZUgZ
         ftey5dmvbstnMWeWbWl5bdmeNjqEyjAGCOLmbVbYhW3PTr5f/XHgbCkxbt97hqxZ72UP
         BQxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="ayZ/p5Z7";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=/y5zcCfwVrX+OUOaWHhqyrx52HnQ+exGmrmAcBqDHDo=;
        b=h82c3BNFd3S5gtw69eHj2cmR+MGzdvNf9zghSQWGDrRQT5LbzAcBsHeETNrJzmZ5rI
         gda5c+WbOyIt379T2/d8yiWAXGMR4OGbfMEwE4wGbh7A3/eXL3Dd9aqHzZyB/MbUtWWD
         irU61ryB7ZUy/mbUGuaxFDfwfsq6VQMxML5PJVlAc1tqCQbJ6C2Kplocag9+JBgpvzwK
         KJVFJ+0FkNeuxDlUWm66H1zv2L6d/egwz6b16P2dTGzL6+YVs6nT4sqgbzyWqIwJ97H5
         k2yvX20V94Ox5Lg/d5IXIXWvJhjqcjAbztzJBoVCv45Ag5ay8mWpCkjYn3p3ZW7jLfDW
         iZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/y5zcCfwVrX+OUOaWHhqyrx52HnQ+exGmrmAcBqDHDo=;
        b=dGwiFSKPcNPJKKY/fqCiouuFC0RvoMChitHtFqr60brSOgDnhtY/iutrih4BRES/yE
         M/7I4tnSpKNI0YYh47S1JuSS7IhK65bEj2Rc+bZdEG9gI5uCCYsiwqux5jxY7hZ6/Nl1
         vJKC1/WXa37e30hZSaaRTCCd0WsMQEkZp9PdHdsrBmjgiHnp50GngNORvilnRwAvn9Kb
         zwNmUbXNwigd+2ZhIt9A+NxML+z69/Pn7B0+hkmzhJBNa0zzp2yuqAdLzytpn8+uPS/j
         2LyT4BPQrwDVBBZqj4fnHaebqUetgQj9D5jeJF18BlE6s+o5Wu/OgPirQIjtrS2tcnu9
         ZZTg==
X-Gm-Message-State: APjAAAWBY3SPVa1TVXWCXkr8TBiWcc/7ZCZaqMLiQvyNEg72jZICQ8Zv
	1agG/vvy4DErOgt8YsPUb2Q=
X-Google-Smtp-Source: APXvYqy3L8hcXiWAr3ylkKzd8F0IXxCozN8yGaMJ8kYb3Y+Xl/BGSTD4ucOh1kJ3l17I4TE4Ks6NRA==
X-Received: by 2002:a67:cd0a:: with SMTP id u10mr5488402vsl.156.1577180922536;
        Tue, 24 Dec 2019 01:48:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:ed04:: with SMTP id l4ls1666574vsp.5.gmail; Tue, 24 Dec
 2019 01:48:42 -0800 (PST)
X-Received: by 2002:a67:3313:: with SMTP id z19mr19781675vsz.216.1577180922015;
        Tue, 24 Dec 2019 01:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577180922; cv=none;
        d=google.com; s=arc-20160816;
        b=d4ozl9RvgN5CWPZcKqClXgVQt/4FKx3XSjN1UcE4O0hbkYB9ZtFC8JutWeI16xOa/U
         /Ie242JUXqSexYwO3HKwpL4bVeqoSgEO+e4kBPbA1fdpfPrXMJ8ITMrbvkC7dvbxytmr
         H8Wm/SUlP3Mi10zLli69/ri6y6+cwLET6wJdrbY9Bv3ldTnvCMYQJGLO7WDB53O1PZjU
         jIR3F9T4IP8A2sy6uWFWouaDpzM+064pR44HjvZLBUnw8IurAu3/G4uI0eiLf0ovus6i
         AtJkrYLOyns2Y530d/EP7wJRRl5rEPaHX551cEzOeuR5cTlmd/t20ev42F4F7AJDvtm+
         ecwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=Rkg9txpYridaYUNv2FmGpib9nYjO2gKGYeDc6prc4V4=;
        b=DqRJ665/b9vzVNR+Kl1UJOqKpAIACnFeMX57e8voHFjKwkvC9O7Ja76rDXG2MzYtQ1
         bLzh1z11LU+O3J+vSxJ5QanO375bnlwTpuj4pi9xojuMlps97r/4ToUdNGuFaShgfrJV
         JcO5hoiLq/13CeFl9ON0qZ2ZCJlh/LlKTiKBX/QY5zG2iNFjZtWXkpgt7tvJg47Cudq7
         CelYPTCvdFouLjan0RrHRdF9Rl33C3ScYbstYryvGFTbTFI8D1P9II3UpYPiLUy7OoC6
         xUMaGfUWmH5Lrvtods4p/G/fiGEkMYsUrg1CSsFktX8jswBWuGQzSHqCgFtEulV9V1dE
         fDAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="ayZ/p5Z7";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id k26si972964uao.0.2019.12.24.01.48.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Dec 2019 01:48:41 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBO9mfno043417;
	Tue, 24 Dec 2019 03:48:41 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBO9me6h082306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Dec 2019 03:48:41 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Dec 2019 03:48:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Dec 2019 03:48:39 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBO9mcUN063157;
	Tue, 24 Dec 2019 03:48:38 -0600
Subject: Re: [PATCH v4 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Lokesh Vutla <lokeshvutla@ti.com>, <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
 <20191223151353.22495-5-nikhil.nd@ti.com>
 <815ba243-8534-764d-1895-dbcf403a8a2d@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <3769aa5c-e0a0-aaca-3783-f273be67de2a@ti.com>
Date: Tue, 24 Dec 2019 15:18:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <815ba243-8534-764d-1895-dbcf403a8a2d@ti.com>
Content-Type: multipart/alternative;
	boundary="------------0F1CA04F6F203EA6FF8CAC6E"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="ayZ/p5Z7";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------0F1CA04F6F203EA6FF8CAC6E
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 24/12/19 9:42 am, Lokesh Vutla wrote:
>
> On 23/12/19 8:43 PM, Nikhil Devshatwar wrote:
>> Add the linux demo cell config for j721e-evm board.
>> Also add the required device tree for booting Linux kernel
>> in the inmate cell.
>>
>> This cell config acts as a reference for partitioning
>> devices across the 2 Linux cells.
>> This will be updated as support for more devices get added.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>
>> Notes:
>>      Changes from v3:
>>      * Add gpio, emmc and USB device in the DTS with upstream bindings
>>      * Describe the irqmap for easy understanding and verification
>>      * Update power-domains properties
>>      
>>      Changes from v2:
>>      * Only add the DT entries for devices with stable bindings
>>      * Organize the DTS to match the bus topology with upstream kernel
>>      
>>      Changes from v1:
>>      * Split up the peripheral mem_region to match with kernel dts
>>      * Add GPU, multimedia decoder and display devices
>>
>>   configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
>>   configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
>>   2 files changed, 695 insertions(+)
>>   create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>>   create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
>>
>> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
>> new file mode 100644
>> index 00000000..51470a57
>> --- /dev/null
>> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
>> @@ -0,0 +1,433 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Device Tree Source for J721E Jailhouse inmate kernel
>> + *
>> + * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/pinctrl/k3.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
>> +
>> +/ {
>> +	model = "Texas Instruments J721E Inmate Model";
>> +	compatible = "ti,j721e-evm", "ti,j721e";
>> +	interrupt-parent = <&gic500>;
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	aliases {
>> +		serial3 = &main_uart1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial3:115200n8";
>> +	};
>> +
>> +	hypervisor {
>> +		compatible = "jailhouse,cell";
>> +	};
>> +
> [..snip..]
>
>> +
>> +	cbass_main_navss: interconnect0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		main_navss_intr: interrupt-controller1 {
>> +			compatible = "ti,sci-intr";
>> +			ti,intr-trigger-type = <4>;
>> +			interrupt-controller;
>> +			interrupt-parent = <&gic500>;
>> +			#interrupt-cells = <2>;
>> +			ti,sci = <&dmsc>;
>> +			ti,sci-dst-id = <14>;
>> +			ti,sci-rm-range-girq = <4>;
>> +		};
>> +
>> +		main_udmass_inta: interrupt-controller@33d00000 {
>> +			compatible = "ti,sci-inta";
>> +			reg = <0x0 0x33d00000 0x0 0x100000>;
>> +			interrupt-controller;
>> +			interrupt-parent = <&main_navss_intr>;
>> +			msi-controller;
>> +			ti,sci = <&dmsc>;
>> +			ti,sci-dev-id = <209>;
>> +			ti,sci-rm-range-vint = <0xa>;
>> +			ti,sci-rm-range-global-event = <0xd>;
>> +		};
> You should drop this node. The address is not mapped in
> k3-j721e-evm-linux-demo.c and there are no users in this DT. You should be very
> careful when virtualizing inta and udmass.
I am waiting for mcasp bindings to be supported in mainline kernel.
Once it is done, we will start using UDMA, inta, intr from linux-demo cell

>
>> +	};
>> +
>> +	secure_proxy_main: mailbox@32c00000 {
>> +		compatible = "ti,am654-secure-proxy";
>> +		#mbox-cells = <1>;
>> +		reg-names = "target_data", "rt", "scfg";
>> +		reg = <0x00 0x32c00000 0x00 0x100000>,
>> +		      <0x00 0x32400000 0x00 0x100000>,
>> +		      <0x00 0x32800000 0x00 0x100000>;
>> +		interrupt-names = "rx_016";
>> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
> [..snip..]
>
>> +
>> +/ {
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +		autorepeat;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&sw10_button_pins_default>;
>> +
>> +		sw10 {
>> +			label = "GPIO Key USER1";
>> +			linux,code = <BTN_0>;
>> +			gpios = <&main_gpio2 0 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +};
>> +
>> +&main_pmx0 {
>> +	sw10_button_pins_default: sw10_button_pins_default {
>> +		pinctrl-single,pins = <
>> +			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
> hmm..is this working? IIRC GPIO group should be selected along with mux mode,
> else it will be routed to GPIO0.
Good catch. Since many configs are not enabled in mainline kernel, I 
missed these failures.
I enabled the configs an it is failing. I shall send the fixes 
separately now that the series is merged in next

Nikhil D

>
> Thanks and regards,
> Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3769aa5c-e0a0-aaca-3783-f273be67de2a%40ti.com.

--------------0F1CA04F6F203EA6FF8CAC6E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 24/12/19 9:42 am, Lokesh Vutla
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:815ba243-8534-764d-1895-dbcf403a8a2d@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

On 23/12/19 8:43 PM, Nikhil Devshatwar wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Add the linux demo cell conf=
ig for j721e-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

This cell config acts as a reference for partitioning
devices across the 2 Linux cells.
This will be updated as support for more devices get added.

Signed-off-by: Lokesh Vutla <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:lokeshvutla@ti.com">&lt;lokeshvutla@ti.com&gt;</a>
Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---

Notes:
    Changes from v3:
    * Add gpio, emmc and USB device in the DTS with upstream bindings
    * Describe the irqmap for easy understanding and verification
    * Update power-domains properties
   =20
    Changes from v2:
    * Only add the DT entries for devices with stable bindings
    * Organize the DTS to match the bus topology with upstream kernel
   =20
    Changes from v1:
    * Split up the peripheral mem_region to match with kernel dts
    * Add GPU, multimedia decoder and display devices

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
 2 files changed, 695 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/=
inmate-k3-j721e-evm.dts
new file mode 100644
index 00000000..51470a57
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for J721E Jailhouse inmate kernel
+ *
+ * Copyright (C) 2016-2019 Texas Instruments Incorporated - <a class=3D"mo=
z-txt-link-freetext" href=3D"http://www.ti.com/">http://www.ti.com/</a>
+ */
+
+/dts-v1/;
+
+#include &lt;dt-bindings/interrupt-controller/irq.h&gt;
+#include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;
+#include &lt;dt-bindings/pinctrl/k3.h&gt;
+#include &lt;dt-bindings/input/input.h&gt;
+#include &lt;dt-bindings/gpio/gpio.h&gt;
+#include &lt;dt-bindings/soc/ti,sci_pm_domain.h&gt;
+
+/ {
+	model =3D "Texas Instruments J721E Inmate Model";
+	compatible =3D "ti,j721e-evm", "ti,j721e";
+	interrupt-parent =3D &lt;&amp;gic500&gt;;
+	#address-cells =3D &lt;2&gt;;
+	#size-cells =3D &lt;2&gt;;
+
+	aliases {
+		serial3 =3D &amp;main_uart1;
+	};
+
+	chosen {
+		stdout-path =3D "serial3:115200n8";
+	};
+
+	hypervisor {
+		compatible =3D "jailhouse,cell";
+	};
+
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
[..snip..]

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+	cbass_main_navss: interconnect0 {
+		compatible =3D "simple-bus";
+		#address-cells =3D &lt;2&gt;;
+		#size-cells =3D &lt;2&gt;;
+		ranges;
+
+		main_navss_intr: interrupt-controller1 {
+			compatible =3D "ti,sci-intr";
+			ti,intr-trigger-type =3D &lt;4&gt;;
+			interrupt-controller;
+			interrupt-parent =3D &lt;&amp;gic500&gt;;
+			#interrupt-cells =3D &lt;2&gt;;
+			ti,sci =3D &lt;&amp;dmsc&gt;;
+			ti,sci-dst-id =3D &lt;14&gt;;
+			ti,sci-rm-range-girq =3D &lt;4&gt;;
+		};
+
+		main_udmass_inta: interrupt-controller@33d00000 {
+			compatible =3D "ti,sci-inta";
+			reg =3D &lt;0x0 0x33d00000 0x0 0x100000&gt;;
+			interrupt-controller;
+			interrupt-parent =3D &lt;&amp;main_navss_intr&gt;;
+			msi-controller;
+			ti,sci =3D &lt;&amp;dmsc&gt;;
+			ti,sci-dev-id =3D &lt;209&gt;;
+			ti,sci-rm-range-vint =3D &lt;0xa&gt;;
+			ti,sci-rm-range-global-event =3D &lt;0xd&gt;;
+		};
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
You should drop this node. The address is not mapped in
k3-j721e-evm-linux-demo.c and there are no users in this DT. You should be =
very
careful when virtualizing inta and udmass.</pre>
    </blockquote>
    I am waiting for mcasp bindings to be supported in mainline kernel.<br>
    Once it is done, we will start using UDMA, inta, intr from
    linux-demo cell<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:815ba243-8534-764d-1895-dbcf403a8a2d@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+	};
+
+	secure_proxy_main: mailbox@32c00000 {
+		compatible =3D "ti,am654-secure-proxy";
+		#mbox-cells =3D &lt;1&gt;;
+		reg-names =3D "target_data", "rt", "scfg";
+		reg =3D &lt;0x00 0x32c00000 0x00 0x100000&gt;,
+		      &lt;0x00 0x32400000 0x00 0x100000&gt;,
+		      &lt;0x00 0x32800000 0x00 0x100000&gt;;
+		interrupt-names =3D "rx_016";
+		interrupts =3D &lt;GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH&gt;;
+	};
+
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
[..snip..]

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+/ {
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		autorepeat;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D &lt;&amp;sw10_button_pins_default&gt;;
+
+		sw10 {
+			label =3D "GPIO Key USER1";
+			linux,code =3D &lt;BTN_0&gt;;
+			gpios =3D &lt;&amp;main_gpio2 0 GPIO_ACTIVE_LOW&gt;;
+		};
+	};
+};
+
+&amp;main_pmx0 {
+	sw10_button_pins_default: sw10_button_pins_default {
+		pinctrl-single,pins =3D &lt;
+			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
hmm..is this working? IIRC GPIO group should be selected along with mux mod=
e,
else it will be routed to GPIO0.</pre>
    </blockquote>
    Good catch. Since many configs are not enabled in mainline kernel, I
    missed these failures.<br>
    I enabled the configs an it is failing. I shall send the fixes
    separately now that the series is merged in next<br>
    <br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:815ba243-8534-764d-1895-dbcf403a8a2d@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Thanks and regards,
Lokesh
</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3769aa5c-e0a0-aaca-3783-f273be67de2a%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/3769aa5c-e0a0-aaca-3783-f273be67de2a%40ti.com</a>.<br />

--------------0F1CA04F6F203EA6FF8CAC6E--
