Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBE5G7KFQMGQEZUFPKUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7C440E7E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 31 Oct 2021 13:59:00 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id x8-20020a2e5848000000b00212c1f21630sf2235379ljd.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 31 Oct 2021 05:59:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1635685140; cv=pass;
        d=google.com; s=arc-20160816;
        b=RmK65MGDGNoS76NjdlB6uONPRYHPUBRMeAkl6U9sbcIdPI7PoPAVP99Ym6+GI/R9r/
         viudBunNIScRB49VZBlbpfVbleUlXL5LCUvAWTaiwM9Cwr1X68u4MTbO1Gr/cdHdFZoQ
         mOkb0eZqZ9xTZiVqIVJ6BTMWZmiWuagcF8aoY8mCBUQbPSAPT0YR7x3+i7CZC6DxTGwp
         HdHng+UBFZNcY/2szc8mTvU/Mm+dXdi6J2dPpM2HcQAhzJWOo+TqsYLBHhwrhF0NeUL2
         9ylIfeYsd1Zol38GN7Q0ra3Jrn34WI0ICGKlHw4L91EtPxmYa+fKR/0EQqs8tgc33/sk
         s5Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=80TyKmF1Z34ePUqXgoJC5chq4ejCnNlQSM6p0hvoZj0=;
        b=mnZFI4sxhMxWQBIq5Fj9I4jYWyHdKRvelJY7KGRtTQsCsV0tsbV7xBo5sJ49Xf+m9P
         Zm7XrE3Xqmrouayc+NrgGpPFyxCWEfL3eyHo3TOcdZTks/y16eeJnRB+5h6DUZ5Mls/f
         WWlF1AYIBMdf18q3Gj1B5jJ/JXC+anPdKuveYC6SgvCG/Kj9LSOVr5qdj4Q781xHbopI
         XyYAAlbX52fHPjqEBE9z9Rrabrlos8QOECG1Tc6DoXqy4qe1b2d9tfjAI/wNdJ+cqDkW
         WiVHUHd3uxlPcoRmoQZ/dh8yXuicRfOR/imduDkGNRVGUEnMeJScjSUmacyzzGFnD3II
         g0rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=IJD51ccG;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=80TyKmF1Z34ePUqXgoJC5chq4ejCnNlQSM6p0hvoZj0=;
        b=rYjScqSUmVbMbJuWcGcZb76ao5XMNpcKf7ZT7hkj0mgt16j1Zj/dEyaM72SGXf0dmC
         jQYuXkZF+YFj6rwZNIOZk0GuJcGef0jfy1ogid6fENvBagCRMp/PW2NN+g6uqGLwFL0f
         E78MK602HJgDbmbEptlYAyGvY6g3RD7ZPHmGheXhSjcHRzWxKqiDWlxs1nfb/M42xxVb
         A+JhIk+A4H2rb8Ccp9TinWnWhoLSyidIvg76dXP/6tilXmobWHZUtpEDwATRDYDCf3zy
         9F6qd+AX30pPQRAfBUwgOvFeFmatQ6N7RTtetEA7kqJ33Ef0dHqoFWBtkbQfT/a+iU6A
         AgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=80TyKmF1Z34ePUqXgoJC5chq4ejCnNlQSM6p0hvoZj0=;
        b=EIZNHwaMXp0R7B7N/Lo0/Ij4U5Q/ZW7U1dCdben5g68Mo4vUqseeo48zuNiC5L74lV
         iggwIWVO4QvRpajLXpiaHQVkD1t5J3XIXe5T8HUt6vHY4P8DqTu8ihklHOBCLuTRZECt
         W0fD/79JYM/NFca2uK0u2xpMpZsW8noK1PyumRSz+dSLNBn2Gw85DV6vb7kRCUKlz12u
         muzQvc3pECahCmgcbdHyl9ldDEub6RsII1X5L4/rxB6PXG+snVzlrWFKOy1HCYS0SJq2
         tELEe/antz/4CIYU9H4p+bfqoXswOpV35Mi+eC07J/uc4dckZWlXdGTQgdqpYu5c7/9i
         DvHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QMlmCWoTCATWjppJ0FGL7HsGnWWJ2Lvj0+yQ+zcfOcyzUr6hc
	Tl5/ieNpz1BENnCtKiMXk6A=
X-Google-Smtp-Source: ABdhPJwuyrs/vUuHXYEI/0Vxcl7dhCCSQkDG/Sr1bDtfYfYh32mGwQyS5rxt9BS7t3LVcslTT1puUA==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr21066232lfq.553.1635685140277;
        Sun, 31 Oct 2021 05:59:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1314:: with SMTP id x20ls2590926lfu.1.gmail; Sun,
 31 Oct 2021 05:58:59 -0700 (PDT)
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr22170359lfb.475.1635685139135;
        Sun, 31 Oct 2021 05:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635685139; cv=none;
        d=google.com; s=arc-20160816;
        b=FxMNq5mMLcVFIDU8zZoMD5EIDvoJeXGoE5Bu6lFBKGQINP7+K9GaOEZ9cZC2xcZvdl
         nalFkLVXAT/iH1jWFIPEdXo6cgE9DgeKBMvhqj24oeh4a74o5y+UDXLELHbOm1XUlqMY
         WPhNZ9r8vJZAvIto60MORoSP+shhgnZFFri8dq3Rawj+HXfo1rSSu1XRPxP83uDl9rLT
         B8coLrjuuhsGyquJx+WrMyUvzbX3EE7MtpFBqLck2NV+SVAgHXPuHmf0TNNnUGcQCo7B
         RVwk0v9/Q9DDVKyzL/H4IDzIpkPaChobkKPTQCxQ77DIZDMFCLOFsbZq4LABVdXOWlNr
         n5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=zCzrcbAe+vdV90m5AJqbMzM4Adrt9IRgQ2z/OJNX5ko=;
        b=m1deoZBP5a8ZmED3c8laSSwDWNOc14/eUe6+ZRIE6uuglu09kFJHn1MxIAQtI7MfNe
         OKOj1fEVWNO3Fc2+d2f2UPi4sJexVv6braSWenktfdNsz3XRUTzy4aHUdNPk9ixB+Sxo
         FDoBX7xVSHt005KRV2E+gN5oD430+CiA0JA7oJK38Cn3wRS5ujZyU0RsZrnFviH0T2ij
         pnVi22oNEUVY9UPX6buqBLDLdHEj/E0720FS45aRzSqG6oatMXSHRlIMIUTRMEiAJt8D
         UhJHtHwJSjpOSzE1qVUP2ImR91R0fJ4gmZq2k0zRVd93KPCSK8rTmzzbqRhBzqXkgft0
         9Nyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=IJD51ccG;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id z4si864559lfr.3.2021.10.31.05.58.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPZj-1mLUhf1MGX-00MERB; Sun, 31
 Oct 2021 13:58:58 +0100
Subject: Re: [PATCH 2/2] configs: arm64: Add Linux inmate DTS demo for NXP
 LS1088ARDB platform
To: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>,
 jailhouse-dev@googlegroups.com
References: <20211022151310.6058-1-anda-alexandra.dorneanu@nxp.com>
 <20211022151310.6058-2-anda-alexandra.dorneanu@nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <10f11bc0-ef4f-78e8-506e-470d4bd2dbd0@web.de>
Date: Sun, 31 Oct 2021 13:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022151310.6058-2-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:HOsQoEKa5+WJPehdS2kPcP9Klkq6h7BcymFRHOWYATuqgHZfyp8
 p4RVsDpPS9XxJj2KkLbj9rGuP9weUk1FKPQ884tbJHR1UxWc++1lgRMGXOM98PczwiLLKG2
 K4O8+QTZ+2UkFFrAjenvyEx5M+I1ecpwvhfv66ar5xR6nJePHSCXSFYRdoYOHOhbonrQ7ny
 Rut9kLw7DpsMeweDv0zAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zD1X+MSEY1A=:nLti1Q7sUYfTQWkZ40I88x
 M6K6jwUcS9v+JoqR+13KCEogR2EnPqRj5oizFN3pueLkl4aDZfbodI9GqIFjz18E0rrIppWyj
 ntC5rSn+gUrJsv7BDbOg85TnZhAjuuqmvfjZhKr/cvQ79/NuVvM4et7soH//KbLK5Qp5yD+IJ
 EJ+Zh1Zz8DAs8jwXDbdgy+aJFygx4VihaYla36TeSPLLgf6QG8ThJSCxoQe1xubW0Yr4HYRl3
 OUisQNSpDcW8FfaKI9WTEmMX61QCIAYFlugtyN2L/aBUhVWuBcJC1EMpuwokHNtqYUr+5vZEl
 Vwlq8ylz8yNgshMtGH2kI7JGnYr3yWJpSCIKIaUxLJTrG7ZXw6ogpO1mW07tMPX1n15Y1dxkJ
 3o5SDYjaqInw8B9aBygzt5QIoE1HlS62oDjLedEfibA/fPDnO3DoeKbYx8oWLCAatUQGKhCL3
 dFC9VMLUdS3rhgBrvj/1DH5WrIv8+rY9M/1P5m3yFV9BUH1kn+edMKcXbdDUdps96PvJ788b7
 oTaYasJS8mUXHfpglyuC1vy3a2CMUvgap4tI5GY0ZL4c9FuKNUhj9PVPuVNPJIEKgrzyXWGb/
 M2LPsTfohJ4QwB8uNPFxmbZlnP3f3okS6zNBuc2hrakIUl/o1xRot3+j5K7YVtQYrZu2kV0TX
 7sLrvJsvAMou55gqi1V263frpMyubfJkKC7Qh2bKvibMYnPjlL/XdH/rZ+V65S9gNaRJ9ZWXe
 A3iircjAOevnoLatoZzUj6lAxxVk2QJivISSPJtfCA0Bm3Jrm764sDAInWTTFZYiWbJeY4QC5
 7G67lMxxZFOwidYAs0lqpaIiB4mEuX5k2hVp+fHV3wtXrdfEp0erjxik1L+qr4F9I7RrSE21j
 3lI2LHHj4xcb6xPigLr1T+42FfMqybYNHQWLwIHGxjXLiRDw4yV/0kEtmfPpw5CnXmFzb/h2X
 B8wgkwfJ6VCX3Mv9p2lbF8I7bPJWBL9UUI4mRMyC1GDQfzhwMWoQj/sEpv2IWncLkYl2BGINA
 9+ZBkp3IoESBGYyyDGN9iWWl/C2bWFiwkNFsy9qN6sxeG+0OV9NhntS2OV/KN7NDb48mXoduJ
 7zsq4nfTmeqIBo=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=IJD51ccG;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 22.10.21 17:13, Anda-Alexandra Dorneanu wrote:
> Add device tree demo for Linux inmate running on NXP LS1088ARDB platform
>
> Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
> ---
>  configs/arm64/dts/inmate-ls1088a-rdb.dts | 135 +++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls1088a-rdb.dts
>
> diff --git a/configs/arm64/dts/inmate-ls1088a-rdb.dts b/configs/arm64/dts/inmate-ls1088a-rdb.dts
> new file mode 100644
> index 00000000..91fac3f7
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-ls1088a-rdb.dts
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree for inmate cell on NXP LS1088ARDB platform
> + *
> + * Copyright 2021 NXP
> + *
> + * Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "fsl,ls1088a";
> +	model = "LS1088A RDB Board";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &duart1;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			clocks = <&clockgen 1 0>;
> +			cpu-idle-states = <&CPU_PH20>;
> +			#cooling-cells = <2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			clocks = <&clockgen 1 0>;
> +			cpu-idle-states = <&CPU_PH20>;
> +			#cooling-cells = <2>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	idle-states {
> +		entry-method = "psci";
> +
> +		 CPU_PH20: cpu-ph20 {
> +			compatible = "arm,idle-state";
> +			idle-state-name = "PH20";
> +			arm,psci-suspend-param = <0x0>;
> +			entry-latency-us = <1000>;
> +			exit-latency-us = <1000>;
> +			min-residency-us = <3000>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	sysclk: sysclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "sysclk";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <1 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <1 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <1 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	gic: interrupt-controller@6000000 {
> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
> +			<0x0 0x06100000 0 0x100000>, /* GICR(RD_base+SGI_base)*/
> +			<0x0 0x0c0c0000 0 0x2000>, /* GICC */
> +			<0x0 0x0c0d0000 0 0x1000>, /* GICH */
> +			<0x0 0x0c0e0000 0 0x20000>; /* GICV */
> +		interrupts = <1 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		clockgen: clocking@1300000 {
> +			compatible = "fsl,ls1088a-clockgen";
> +			reg = <0x0 0x1300000 0x0 0xa0000>;
> +			#clock-cells = <2>;
> +			clocks = <&sysclk>;
> +		};
> +
> +		duart1: serial@21c0600 {
> +			compatible = "fsl,ns16550", "ns16550a";
> +			reg = <0x00 0x21c0600 0x0 0x100>;
> +			clocks = <&clockgen 4 1>;
> +			status = "okay";
> +		};
> +	};
> +
> +	pci@13000000 {
> +		compatible = "pci-host-ecam-generic";
> +		device_type = "pci";
> +		bus-range = <0 0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0 0 0 1 &gic GIC_SPI 49 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 2 &gic GIC_SPI 50 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 3 &gic GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +			<0 0 0 4 &gic GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x0 0x13000000 0x0 0x100000>;
> +		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +};
>

Thanks, both applied.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/10f11bc0-ef4f-78e8-506e-470d4bd2dbd0%40web.de.
