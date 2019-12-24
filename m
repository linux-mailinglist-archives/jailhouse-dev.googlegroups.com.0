Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOOJQ7YAKGQEDKUNZQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDD12A006
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 11:13:13 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id t3sf8623992wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 02:13:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577182393; cv=pass;
        d=google.com; s=arc-20160816;
        b=VX7cKdtnnijAk7ZP00J4Q2nALYNr3R0W0zQ1cXEVs2rJkwY28ZBDKdRIxIdLjHvPMY
         ujXinJY/4JmOWU3G+pDRwQJn+oUU9P4ezfTsWQIVteO1A+mdwLl3qIvk8jfvTnzzDZat
         L4jlbQcSTGpSDUHj2ZRDTy/ATbdruvt9FYPuPML+nGBXFURkdHPVOZJ22crl0SaMXWg9
         hWIPVAhyl4bSV12YyRGgm2iO6FdeSPHTpYcG1rWmeuYzsGx5eCLxiUuzvCzEIwuP0Wni
         bhYjtlwDIYof/4hdbIY0md7yrInjBpWnNsFnuCD7VHoo9Iu8pmSkbt8IP8QcuS+OztH/
         IDPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=zamMYnUlJyRw7O7pzPaZJWr3sZore5YGUlnjpCosXhA=;
        b=MQoQOoOIO0nadCRvB+yP44DY35Rxq7XrHZNgrwVYC9eZBuwJaiyJBFrCtqPkJF3eGc
         evZgQVPSuHAt7tI0Pxmm1k9g+B9zHQch5033ZCWrGAW3hnBWUERLSdvu8iRU2zo2EqoO
         sAFkGp76LB8IpUI+czbOXShYjAH0uz5tTpw9Se2+aSyT9SneochYtNpEypL78keELFtw
         ADPEhDn3rKgAcDBOsj8WQbmcPIH+R7MiXNopRb5Z9Lq7QSxfjMe1WVIzlUqqOcQsQjpu
         bQzhf1DbRSosZX4KfR1V5X0j+a8WO1HMYSwMI0lJ3EGhxxA8zJzD+X1JmAdiMKLE8Tfw
         jB8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ZU3ooqkG;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zamMYnUlJyRw7O7pzPaZJWr3sZore5YGUlnjpCosXhA=;
        b=bLPrJNMncgkgOuItwxsRnUAp5m7wHXxrqaA4dwA3tlr8zfgtc7GMpOQ1NF+zBNkhTG
         WNSjjr+mOpJ9m5FTjWKEdTMdy9LZptNZiRPS7jaIMqXj6BcBwblmSDWMzEIMUjImEHvs
         3fSQBsMNu3+Prua+yseDHS8W5ejZkoovBXCvKTliThT71JJRUJYik3SSeMUw0yV0zDW5
         Afn0RHVVfemUPIkiWOro+prln0q8vhZammi2XQqUd2ht0WbWqKwSiQ2efx08QHySpOJo
         Tp8IQeNUXnqciMD6ivyMyYe07Ehia8Wz0W3EMxZidLnWyQKn03sXj6vJj3Z3zls6BwTd
         vvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zamMYnUlJyRw7O7pzPaZJWr3sZore5YGUlnjpCosXhA=;
        b=To2E5qaJbnrZLDZ9HgPmGNPTPnnHLGwsxeGuK9cHF6znZ/TCG0s2KwpBFXzs8uLH0r
         tv8Qu/ojOmyFTKAlUGp12n5dYPIfES+5JEyEwhg4kjO+JBwvSQ2+/pcb1CuiCt7LdHnC
         pMXkHwuOYRoZXMJ+2cUTarQXauR/ndQlYI3UnXsmkA6qOe3G0xozHjp1xdiWFpPRxdHX
         GonCehmO7UIhWLjMLR/AZg+um1J/qY4FwOliOgwRukO0uZFKWwf0iXSbbPK25CHuMTF9
         TDjiU6XR8gyVilgjHhAnECHIEQl8VJ4R28mQlg5e15zPyBVTzWd1MvGjJab54MV0o5Pc
         +q/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWpm0Ae5toEOvw0Tf9cP9MXW37ymfO4/mUeD2Im7sB+i90tNjBL
	hu+1IYbj4HHLmcS9K13CvZE=
X-Google-Smtp-Source: APXvYqw1cZPUP2Pz2WzrP2JY5+cWMT+7tdc+OqCS2Hb1eOJFszLi487sjmrIdpWNR8YENvAiPWlMQg==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr3386337wmj.105.1577182393244;
        Tue, 24 Dec 2019 02:13:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls5002896wrs.9.gmail; Tue, 24 Dec
 2019 02:13:12 -0800 (PST)
X-Received: by 2002:a5d:6703:: with SMTP id o3mr36276032wru.235.1577182392596;
        Tue, 24 Dec 2019 02:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577182392; cv=none;
        d=google.com; s=arc-20160816;
        b=tphN6wFiUyDSEJfbcoHTx4JUVQEJcEgmafyxahGF1JpX6sFYsv6YAfcgB9TuU89JhP
         7/skHTa4xkhnkoMnyCi7ETfBlhNeuKd1DfBxs5Antq0F3L191MoUINCp4bYeBBy3xD5t
         XMPXR/9LEE0H34diehjBTlsvtA0su5ASJh0xiSbdSv0wtq6BDSuwYzPIssM/Nar8AXJx
         3PaREFqhsQnkHmw21Ef7CnKWzc/KUYrPbKAsdkxLjgoPzy56IxVREwB68vmLz+JFNYwl
         xe6kWF6qMWWMDQM/bJi5yEPxNKlP8fLGnJnyhUXxdwh68gQLtTEZ10r/n5oKu3vqSOw3
         drFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ISMaUMYXmmfo+h4vJRmDSjMTqX83lAGfjyPTqmvqZYc=;
        b=HbyWMuMPioYof9ScyOOC2PFUtd3UdS1G+Im64h6IjK1Bl48DjWq/H4sm8JYeIOV1cg
         kAcuqp5F/WfRq4C5mbVZQVvBgqFEz9BFd7w+0V5J414/Vb3Pso9NRtpE/WwSh58mU75d
         LBGLIzI0mXfHj1VdXKXzx7QblFPZNyCFtbMAK8NMY6zfN4jXRs+B7hLN1IOef2Clwg2R
         z2jRrfQ9aeh9MSMJ6/3Z3qDUmvBB8jyka4CrlT1A/Q4eoKgYtf5HyE3XSDmgqtk1p+ZF
         tcM3tOQVO5IeyId2jWSKY4SUkFRGLrlVRf6sckpKm62L8bbZCQCgD3Bbh3JwbWESSzLd
         U6UQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ZU3ooqkG;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t131si88877wmb.1.2019.12.24.02.13.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Dec 2019 02:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M9oaG-1iufXT3a6y-00B2Qd; Tue, 24
 Dec 2019 11:13:11 +0100
Subject: Re: [PATCH v4 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 jailhouse-dev@googlegroups.com
References: <20191223151353.22495-1-nikhil.nd@ti.com>
 <20191223151353.22495-5-nikhil.nd@ti.com>
 <815ba243-8534-764d-1895-dbcf403a8a2d@ti.com>
 <3769aa5c-e0a0-aaca-3783-f273be67de2a@ti.com>
 <ce04ee19-d469-371e-c9b2-1e6d1d69a8b0@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3751863b-3986-0eae-038e-9011e618a759@web.de>
Date: Tue, 24 Dec 2019 11:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ce04ee19-d469-371e-c9b2-1e6d1d69a8b0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:cUVmRaCXXXQCLXgof81Ub/BUFcPvIE4p+AbUfeOSt4IeggzG0CW
 3jatD1SPFDMSU0/TdLgBMvkCCPQz1POiw2Oqs3v5YwqGMxvFvzh3UGRkm/9f80sZoJyvecX
 90SXSqPlwfTP/sardKVVcQX3mjYOhe9xx7coieQe9JZ+FvDYdEdLzv13W4c10N3ol8umZ0d
 Urnj8ToCzzO89A6/HOuIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Qa4wT/f/uA=:TQlTVMLdR5TF+acUy4QDS2
 tWbyQ/FXbliDc0cu7tkaKFtr1F1h2NpyjFvsfMupeb+e6x/YcRR2TQ1ahixGIwDzulF26ODSm
 4Z+8E/bRdtLuB5k0mbzgrJKokn0AXt1F5ypoWhslDwYpHYWUcg7mOqOra1WZdPq5y9JyToyOL
 IwvN3bok2rkvfkS63u3o7Qht/UA90opa/kUPaQhfI5G+zwpeG5w39BoHWKBO7x5MFAcYpG+Eb
 sLpSFYMszQGYqf60HtQIv+gloTe0rFBY5uJm2l4sGuowLecgGR9d2webXTYawPUhqb0RM56UQ
 9elQthzVUSGpnaiFYBTFBv+AGIgbsT3yqIUyAWfUVctSR77KPiuoW4x2FitqSF0haw9Leoafm
 vcxnOeiX9N6xG37EGx2UvyYcz5Yrh8lvPVHM9Ac36dLZQ1XZ85u7PLxf35gsVJBxVur36r2Bf
 tLUwcu9opuqRdjOGToTHbnO8P/y+SwIGzLyLVSZArMJc0fJJOrfCX18uhHGKOiTzYgkZF+bjw
 htFGf4h4aXOaVCAhWCWm34eekn6EWjGJMpVEVIfCLdWQg1uLSrZsene5uvLwwTXMd+Gw/Ewxz
 5odEQ7U/rHcoTKR7rx1SjZbU5T4GaPztaLnTF5lApPRIW7LUVnLu5k506gqdFga19lvWYuOl8
 FKdqKO6f/aM3IvRQHt8p+PCihaZyYsvKHsykEPXFk5m/EqELXkEQuj3q1Q7QL7F5qlXPkbF75
 bWYkfuxWXOyvdHTqLpCpxuLcrdEmgUp8A3h/N9apoBYTTAIpUx2IwXsKIbzls2rLYWaKQ/AwJ
 HnRPxOKqu1q2t5uXYZr8zOXy7hfPazX7T/T22aPek4tzQkeT0PfW0k7ErbAmuv1SeXEimH8bc
 Ha1fsw9U30QmXKGcDq/pO/qVBocdFumf8v2r7ex6n6f10cD2VPaWWGPCbiNzxmUfjwhYfxk17
 m4aPiJvQsWdkemqy1iAPuOcJERtHvnfGpJbnRBCe9bkWGV3fHA+zRSs3y0DTmZUNnr2ihpNo5
 qy8JTv50lvwJAGC5QYNTCcQUVtBRqIp/G519TaB7A1+jmA9c/s9q3nhepkoOiPkDq+VU4oSNv
 08xVA2rcr85DbRXSrdKfnUlhGAWhdP8VqRSUWNQ0sIb08nOu+pK7WJUD1X2HONCkjrYtc3sul
 Au6lgpaQ1zZWKD1CpWux4wEfudI/GgBNPpKW7rbNdcMgVJi7H4ihaZmJOfmLxi4c6sGjn0A94
 JnP4pBt6cjws7GUBXMQM05g7ZQjj1vb6ce4bzsdRvEJ3cSKUFAK68+8c1Pqs=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ZU3ooqkG;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 24.12.19 11:04, 'Lokesh Vutla' via Jailhouse wrote:
>
>
> On 24/12/19 3:18 PM, Nikhil Devshatwar wrote:
>>
>>
>> On 24/12/19 9:42 am, Lokesh Vutla wrote:
>>> On 23/12/19 8:43 PM, Nikhil Devshatwar wrote:
>>>> Add the linux demo cell config for j721e-evm board.
>>>> Also add the required device tree for booting Linux kernel
>>>> in the inmate cell.
>>>>
>>>> This cell config acts as a reference for partitioning
>>>> devices across the 2 Linux cells.
>>>> This will be updated as support for more devices get added.
>>>>
>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> ---
>>>>
>>>> Notes:
>>>>      Changes from v3:
>>>>      * Add gpio, emmc and USB device in the DTS with upstream bindings
>>>>      * Describe the irqmap for easy understanding and verification
>>>>      * Update power-domains properties
>>>>
>>>>      Changes from v2:
>>>>      * Only add the DT entries for devices with stable bindings
>>>>      * Organize the DTS to match the bus topology with upstream kernel
>>>>
>>>>      Changes from v1:
>>>>      * Split up the peripheral mem_region to match with kernel dts
>>>>      * Add GPU, multimedia decoder and display devices
>>>>
>>>>   configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
>>>>   configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
>>>>   2 files changed, 695 insertions(+)
>>>>   create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>>>>   create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
>>>>
>>>> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
>>>> new file mode 100644
>>>> index 00000000..51470a57
>>>> --- /dev/null
>>>> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
>>>> @@ -0,0 +1,433 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Device Tree Source for J721E Jailhouse inmate kernel
>>>> + *
>>>> + * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> + surprised how they can
>>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +#include <dt-bindings/pinctrl/k3.h>
>>>> +#include <dt-bindings/input/input.h>
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
>>>> +
>>>> +/ {
>>>> +	model = "Texas Instruments J721E Inmate Model";
>>>> +	compatible = "ti,j721e-evm", "ti,j721e";
>>>> +	interrupt-parent = <&gic500>;
>>>> +	#address-cells = <2>;
>>>> +	#size-cells = <2>;
>>>> +
>>>> +	aliases {
>>>> +		serial3 = &main_uart1;
>>>> +	};
>>>> +
>>>> +	chosen {
>>>> +		stdout-path = "serial3:115200n8";
>>>> +	};
>>>> +
>>>> +	hypervisor {
>>>> +		compatible = "jailhouse,cell";
>>>> +	};
>>>> +
>>> [..snip..]
>>>
>>>> +
>>>> +	cbass_main_navss: interconnect0 {
>>>> +		compatible = "simple-bus";
>>>> +		#address-cells = <2>;
>>>> +		#size-cells = <2>;
>>>> +		ranges;
>>>> +
>>>> +		main_navss_intr: interrupt-controller1 {
>>>> +			compatible = "ti,sci-intr";
>>>> +			ti,intr-trigger-type = <4>;
>>>> +			interrupt-controller;
>>>> +			interrupt-parent = <&gic500>;
>>>> +			#interrupt-cells = <2>;
>>>> +			ti,sci = <&dmsc>;
>>>> +			ti,sci-dst-id = <14>;
>>>> +			ti,sci-rm-range-girq = <4>;
>>>> +		};
>>>> +
>>>> +		main_udmass_inta: interrupt-controller@33d00000 {
>>>> +			compatible = "ti,sci-inta";
>>>> +			reg = <0x0 0x33d00000 0x0 0x100000>;
>>>> +			interrupt-controller;
>>>> +			interrupt-parent = <&main_navss_intr>;
>>>> +			msi-controller;
>>>> +			ti,sci = <&dmsc>;
>>>> +			ti,sci-dev-id = <209>;
>>>> +			ti,sci-rm-range-vint = <0xa>;
>>>> +			ti,sci-rm-range-global-event = <0xd>;
>>>> +		};
>>> You should drop this node. The address is not mapped in
>>> k3-j721e-evm-linux-demo.c and there are no users in this DT. You should be very
>>> careful when virtualizing inta and udmass.
>> I am waiting for mcasp bindings to be supported in mainline kernel.
>> Once it is done, we will start using UDMA, inta, intr from linux-demo cell
>>
>>>> +	};
>>>> +
>>>> +	secure_proxy_main: mailbox@32c00000 {
>>>> +		compatible = "ti,am654-secure-proxy";
>>>> +		#mbox-cells = <1>;
>>>> +		reg-names = "target_data", "rt", "scfg";
>>>> +		reg = <0x00 0x32c00000 0x00 0x100000>,
>>>> +		      <0x00 0x32400000 0x00 0x100000>,
>>>> +		      <0x00 0x32800000 0x00 0x100000>;
>>>> +		interrupt-names = "rx_016";
>>>> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>>>> +	};
>>>> +
>>> [..snip..]
>>>
>>>> +
>>>> +/ {
>>>> +
>>>> +	gpio-keys {
>>>> +		compatible = "gpio-keys";
>>>> +		autorepeat;
>>>> +		pinctrl-names = "default";
>>>> +		pinctrl-0 = <&sw10_button_pins_default>;
>>>> +
>>>> +		sw10 {
>>>> +			label = "GPIO Key USER1";
>>>> +			linux,code = <BTN_0>;
>>>> +			gpios = <&main_gpio2 0 GPIO_ACTIVE_LOW>;
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&main_pmx0 {
>>>> +	sw10_button_pins_default: sw10_button_pins_default {
>>>> +		pinctrl-single,pins = <
>>>> +			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
>>> hmm..is this working? IIRC GPIO group should be selected along with mux mode,
>>> else it will be routed to GPIO0.
>> Good catch. Since many configs are not enabled in mainline kernel, I missed
>> these failures.
>> I enabled the configs an it is failing. I shall send the fixes separately now
>> that the series is merged in next
>
> Jan,
> 	What do you prefer?
>

Yes, please on top. The in-tree version already has a build fix.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3751863b-3986-0eae-038e-9011e618a759%40web.de.
