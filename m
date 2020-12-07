Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBYNAW37AKGQE7QIAEVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id C02672D0925
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 03:16:02 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id m3sf10252340qvw.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 18:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xnr3W13n+CarybztV+5idJUtEHsK652lgt9jzR6kuyw=;
        b=ASv4sGaieKceD2yCXYb6c0lmfBhAPqDa9fOdTp4Ft64i1MH0MjlioY4pGnr4AL0sUu
         X5zsaLy4HLDvXN6AnYkosPKGkR9nRtzba0A0CO5nZomK2Z4DXbDKr1GH9VdzNtoTARPw
         dh78OcAveqy7YuE55BQEPXI9IaLHuYQx60CiMeopT5k3Plzh4QwYmSIduTia1c7xcQmn
         3NV5JMrgFWrN8k4PbmHyLxooJzJiRm4cp2WvT1lO0EwvNvTmqgEHIfK/eBh+sFqxCv11
         sjVcXUKPL0wRaJV+BptCmjeOj9iYAmfI70q2tE1pyUtBWKW9DBQBqOUbKZ9uO0mYL7yl
         A3Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xnr3W13n+CarybztV+5idJUtEHsK652lgt9jzR6kuyw=;
        b=GRJzijCuvRTincDFsqmoQyuLS4YEDEQkHAfZ9N9+heUK5kMWxYgyyw1BqIV4ESzrEx
         eRuK5ptgiyLPR8PfZ0BC4G+fU25as7ct/PseXye6gfRsLLgFwjT/ZH2wmT53cCyiNfBm
         lnMKsY00I5rk0UmMB3GIyR7532625TwHOYVWTIJE4GhY29cw0cJyh5A63ht+jW0E3UCP
         NjV3YJHAyt05/VuVtnCdVZh4TL1/57Ibp+6u9MSM8mrFZhKOyUGg/9MtH9CJ0yz7EI3m
         Z1wth5JgB0XQtScC8xxc8qRewVNqKq07iUC707xsqnNGtW07/XCpk+Ca/YcdC2xOiE8s
         mHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xnr3W13n+CarybztV+5idJUtEHsK652lgt9jzR6kuyw=;
        b=KsVwCj95UDgHOveEJ0PErhEnnjpgAa39K9mAVjMtNx+cFtyaQSjXulR2Vv5mnbnt40
         ivcHhta1w6ovBQb3I75f/zmiKk59raGXUK83iWln9j2FHNpw/bGrInX25zO0fYFkp1T/
         q8qk/qLcNJxkW60HdEmOIzP0ugDwm8quv/ZQdQOcV6xYTZ1bgZNPxUI/Qge1jDpOCQXC
         sNJslyy+q8wMxA0anvNvFp4kvf4XxPVMAZc+TPBll4KRysQ9T1GkGb1SM/4QghrkzVKb
         DGPjkEGvwjA8t+ytKX++6qEvtDOCFxoy564xK2vNVD5f5uu4c2QJFsiP6lHJzi0oczzY
         8ixA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Jy8jrUqJ2i2t6kiFV0hnXxlm4s0ZIQ8Lrc9ggrYf0qRJ1CQPv
	gJhoyPoFf8ZIPQEvC97mBHc=
X-Google-Smtp-Source: ABdhPJyEW8qsmSGUgvSE0ObeRPUv48EYLHHJksZyVXIh0R2t90/Y/hIqVuUb+E8jmXwDiw1PEvRrMQ==
X-Received: by 2002:a05:620a:13a6:: with SMTP id m6mr4971046qki.319.1607307361691;
        Sun, 06 Dec 2020 18:16:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:648:: with SMTP id a8ls7359004qka.2.gmail; Sun, 06
 Dec 2020 18:16:01 -0800 (PST)
X-Received: by 2002:a37:6189:: with SMTP id v131mr1853422qkb.337.1607307360988;
        Sun, 06 Dec 2020 18:16:00 -0800 (PST)
Date: Sun, 6 Dec 2020 18:16:00 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <88b3f6d5-bbe5-44ae-bb14-639d5a4c5fe5n@googlegroups.com>
In-Reply-To: <c64e1cb0-0311-67f7-3853-fca75bbfc334@siemens.com>
References: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
 <20201204034516.20000-2-Jiafei.Pan@nxp.com>
 <c64e1cb0-0311-67f7-3853-fca75bbfc334@siemens.com>
Subject: Re: [PATCH v3 2/2] configs: ls1046a-rdb: Add linux inmate dts demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2612_1138709890.1607307360266"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_2612_1138709890.1607307360266
Content-Type: multipart/alternative; 
	boundary="----=_Part_2613_349598630.1607307360266"

------=_Part_2613_349598630.1607307360266
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan.

Jiafei.

=E5=9C=A82020=E5=B9=B412=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+=
8 =E4=B8=8B=E5=8D=882:50:13<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 04.12.20 04:45, Jiafei Pan wrote:
> > Add device tree demo for running Linux as an inmate on
> > NXP ls1046a RDB board.
> >=20
> > Signed-off-by: Jiafei Pan <Jiafe...@nxp.com>
> > ---
> > Change in v2:
> > - Added inmate dts
> >=20
> > configs/arm64/dts/inmate-ls1046a-rdb.dts | 177 +++++++++++++++++++++++
> > 1 file changed, 177 insertions(+)
> > create mode 100644 configs/arm64/dts/inmate-ls1046a-rdb.dts
> >=20
> > diff --git a/configs/arm64/dts/inmate-ls1046a-rdb.dts=20
> b/configs/arm64/dts/inmate-ls1046a-rdb.dts
> > new file mode 100644
> > index 00000000..8dcda43c
> > --- /dev/null
> > +++ b/configs/arm64/dts/inmate-ls1046a-rdb.dts
> > @@ -0,0 +1,177 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Device Tree for inmate cell on NXP ls1046a RDB platform
> > + *
> > + * Copyright 2020 NXP
> > + *
> > + * Jiafei Pan <jiafe...@nxp.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > + compatible =3D "fsl,ls1046a-rdb", "fsl,ls1046a";
> > + model =3D "LS1046A RDB Board";
> > + interrupt-parent =3D <&gic>;
> > + #address-cells =3D <2>;
> > + #size-cells =3D <2>;
> > +
> > + aliases {
> > + serial0 =3D &duart1;
> > + };
> > +
> > + cpus {
> > + #address-cells =3D <1>;
> > + #size-cells =3D <0>;
> > +
> > + cpu2: cpu@2 {
> > + device_type =3D "cpu";
> > + compatible =3D "arm,cortex-a72";
> > + reg =3D <0x2>;
> > + clocks =3D <&clockgen 1 0>;
> > + next-level-cache =3D <&l2>;
> > + cpu-idle-states =3D <&CPU_PH20>;
> > + #cooling-cells =3D <2>;
> > + enable-method =3D "psci";
> > + };
> > +
> > + cpu3: cpu@3 {
> > + device_type =3D "cpu";
> > + compatible =3D "arm,cortex-a72";
> > + reg =3D <0x3>;
> > + clocks =3D <&clockgen 1 0>;
> > + next-level-cache =3D <&l2>;
> > + cpu-idle-states =3D <&CPU_PH20>;
> > + #cooling-cells =3D <2>;
> > + enable-method =3D "psci";
> > + };
> > +
> > + l2: l2-cache {
> > + compatible =3D "cache";
> > + };
> > + };
> > +
> > + chosen {
> > + stdout-path =3D "serial0:115200n8";
> > + };
> > +
> > + idle-states {
> > + entry-method =3D "psci";
> > +
> > + CPU_PH20: cpu-ph20 {
> > + compatible =3D "arm,idle-state";
> > + idle-state-name =3D "PH20";
> > + arm,psci-suspend-param =3D <0x0>;
> > + entry-latency-us =3D <1000>;
> > + exit-latency-us =3D <1000>;
> > + min-residency-us =3D <3000>;
> > + };
> > + };
> > +
> > + sysclk: sysclk {
> > + compatible =3D "fixed-clock";
> > + #clock-cells =3D <0>;
> > + clock-frequency =3D <100000000>;
> > + clock-output-names =3D "sysclk";
> > + };
> > +
> > + reboot {
> > + compatible =3D"syscon-reboot";
> > + regmap =3D <&dcfg>;
> > + offset =3D <0xb0>;
> > + mask =3D <0x02>;
> > + };
> > +
> > + timer {
> > + compatible =3D "arm,armv8-timer";
> > + interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_RAW(0xf) |
> > + IRQ_TYPE_LEVEL_LOW)>,
> > + <GIC_PPI 14 (GIC_CPU_MASK_RAW(0xf) |
> > + IRQ_TYPE_LEVEL_LOW)>,
> > + <GIC_PPI 11 (GIC_CPU_MASK_RAW(0xf) |
> > + IRQ_TYPE_LEVEL_LOW)>,
> > + <GIC_PPI 10 (GIC_CPU_MASK_RAW(0xf) |
> > + IRQ_TYPE_LEVEL_LOW)>;
> > + };
> > +
> > + gic: interrupt-controller@1410000 {
> > + compatible =3D "arm,gic-400";
> > + #interrupt-cells =3D <3>;
> > + interrupt-controller;
> > + reg =3D <0x0 0x1410000 0 0x10000>, /* GICD */
> > + <0x0 0x142f000 0 0x1000>, /* GICC */
> > + <0x0 0x1440000 0 0x20000>, /* GICH */
> > + <0x0 0x146f000 0 0x1000>; /* GICV */
> > + interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
> > + IRQ_TYPE_LEVEL_LOW)>;
> > + };
> > +
> > + soc: soc {
> > + compatible =3D "simple-bus";
> > + #address-cells =3D <2>;
> > + #size-cells =3D <2>;
> > + ranges;
> > + dma-ranges =3D <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
> > + dma-coherent;
> > +
> > +
> > + ddr: memory-controller@1080000 {
> > + compatible =3D "fsl,qoriq-memory-controller";
> > + reg =3D <0x0 0x1080000 0x0 0x1000>;
> > + interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> > + big-endian;
> > + };
> > +
> > + scfg: scfg@1570000 {
> > + compatible =3D "fsl,ls1046a-scfg", "syscon";
> > + reg =3D <0x0 0x1570000 0x0 0x10000>;
> > + big-endian;
> > + };
> > +
> > + dcfg: dcfg@1ee0000 {
> > + compatible =3D "fsl,ls1046a-dcfg", "syscon";
> > + reg =3D <0x0 0x1ee0000 0x0 0x1000>;
> > + big-endian;
> > + };
> > +
> > + clockgen: clocking@1ee1000 {
> > + compatible =3D "fsl,ls1046a-clockgen";
> > + reg =3D <0x0 0x1ee1000 0x0 0x1000>;
> > + #clock-cells =3D <2>;
> > + clocks =3D <&sysclk>;
> > + };
> > +
> > + duart1: serial@21c0600 {
> > + compatible =3D "fsl,ns16550", "ns16550a";
> > + reg =3D <0x00 0x21c0600 0x0 0x100>;
> > + clocks =3D <&clockgen 4 1>;
> > + status =3D "okay";
> > + };
> > +
> > + };
> > +
> > + pci@fb500000 {
> > + compatible =3D "pci-host-ecam-generic";
> > + device_type =3D "pci";
> > + bus-range =3D <0 0>;
> > + #address-cells =3D <3>;
> > + #size-cells =3D <2>;
> > + #interrupt-cells =3D <1>;
> > + interrupt-map-mask =3D <0 0 0 7>;
> > + interrupt-map =3D <0 0 0 1 &gic GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
> > + <0 0 0 2 &gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
> > + <0 0 0 3 &gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
> > + <0 0 0 4 &gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
> > + reg =3D <0x0 0xfb500000 0x0 0x100000>;
> > + ranges =3D <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> > + };
> > +
> > + psci {
> > + compatible =3D "arm,psci-1.0";
> > + method =3D "smc";
> > + };
> > +
> > +};
> > +
> >=20
>
> Both merged with minor tweaking.
>
> Thanks,
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/88b3f6d5-bbe5-44ae-bb14-639d5a4c5fe5n%40googlegroups.com.

------=_Part_2613_349598630.1607307360266
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan.<div><br></div><div>Jiafei.<br><br></div><div class=3D"gmail_quo=
te"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=B9=B412=E6=9C=
=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8B=E5=8D=882:50:13&lt=
;j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">On 04.12.20 04:45, Jiafei Pan wrote:
<br>&gt; Add device tree demo for running Linux as an inmate on
<br>&gt; NXP ls1046a RDB board.
<br>&gt;=20
<br>&gt; Signed-off-by: Jiafei Pan &lt;<a href data-email-masked rel=3D"nof=
ollow">Jiafe...@nxp.com</a>&gt;
<br>&gt; ---
<br>&gt; Change in v2:
<br>&gt; 	- Added inmate dts
<br>&gt;=20
<br>&gt;  configs/arm64/dts/inmate-ls1046a-rdb.dts | 177 ++++++++++++++++++=
+++++
<br>&gt;  1 file changed, 177 insertions(+)
<br>&gt;  create mode 100644 configs/arm64/dts/inmate-ls1046a-rdb.dts
<br>&gt;=20
<br>&gt; diff --git a/configs/arm64/dts/inmate-ls1046a-rdb.dts b/configs/ar=
m64/dts/inmate-ls1046a-rdb.dts
<br>&gt; new file mode 100644
<br>&gt; index 00000000..8dcda43c
<br>&gt; --- /dev/null
<br>&gt; +++ b/configs/arm64/dts/inmate-ls1046a-rdb.dts
<br>&gt; @@ -0,0 +1,177 @@
<br>&gt; +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
<br>&gt; +/*
<br>&gt; + * Device Tree for inmate cell on NXP ls1046a RDB platform
<br>&gt; + *
<br>&gt; + * Copyright 2020 NXP
<br>&gt; + *
<br>&gt; + * Jiafei Pan &lt;<a href data-email-masked rel=3D"nofollow">jiaf=
e...@nxp.com</a>&gt;
<br>&gt; + */
<br>&gt; +
<br>&gt; +/dts-v1/;
<br>&gt; +
<br>&gt; +#include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;
<br>&gt; +
<br>&gt; +/ {
<br>&gt; +	compatible =3D &quot;fsl,ls1046a-rdb&quot;, &quot;fsl,ls1046a&qu=
ot;;
<br>&gt; +	model =3D &quot;LS1046A RDB Board&quot;;
<br>&gt; +	interrupt-parent =3D &lt;&amp;gic&gt;;
<br>&gt; +	#address-cells =3D &lt;2&gt;;
<br>&gt; +	#size-cells =3D &lt;2&gt;;
<br>&gt; +
<br>&gt; +	aliases {
<br>&gt; +		serial0 =3D &amp;duart1;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	cpus {
<br>&gt; +		#address-cells =3D &lt;1&gt;;
<br>&gt; +		#size-cells =3D &lt;0&gt;;
<br>&gt; +
<br>&gt; +		cpu2: cpu@2 {
<br>&gt; +			device_type =3D &quot;cpu&quot;;
<br>&gt; +			compatible =3D &quot;arm,cortex-a72&quot;;
<br>&gt; +			reg =3D &lt;0x2&gt;;
<br>&gt; +			clocks =3D &lt;&amp;clockgen 1 0&gt;;
<br>&gt; +			next-level-cache =3D &lt;&amp;l2&gt;;
<br>&gt; +			cpu-idle-states =3D &lt;&amp;CPU_PH20&gt;;
<br>&gt; +			#cooling-cells =3D &lt;2&gt;;
<br>&gt; +			enable-method =3D &quot;psci&quot;;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +		cpu3: cpu@3 {
<br>&gt; +			device_type =3D &quot;cpu&quot;;
<br>&gt; +			compatible =3D &quot;arm,cortex-a72&quot;;
<br>&gt; +			reg =3D &lt;0x3&gt;;
<br>&gt; +			clocks =3D &lt;&amp;clockgen 1 0&gt;;
<br>&gt; +			next-level-cache =3D &lt;&amp;l2&gt;;
<br>&gt; +			cpu-idle-states =3D &lt;&amp;CPU_PH20&gt;;
<br>&gt; +			#cooling-cells =3D &lt;2&gt;;
<br>&gt; +			enable-method =3D &quot;psci&quot;;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +		l2: l2-cache {
<br>&gt; +			compatible =3D &quot;cache&quot;;
<br>&gt; +		};
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	chosen {
<br>&gt; +		stdout-path =3D &quot;serial0:115200n8&quot;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	idle-states {
<br>&gt; +		entry-method =3D &quot;psci&quot;;
<br>&gt; +
<br>&gt; +		CPU_PH20: cpu-ph20 {
<br>&gt; +			compatible =3D &quot;arm,idle-state&quot;;
<br>&gt; +			idle-state-name =3D &quot;PH20&quot;;
<br>&gt; +			arm,psci-suspend-param =3D &lt;0x0&gt;;
<br>&gt; +			entry-latency-us =3D &lt;1000&gt;;
<br>&gt; +			exit-latency-us =3D &lt;1000&gt;;
<br>&gt; +			min-residency-us =3D &lt;3000&gt;;
<br>&gt; +		};
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	sysclk: sysclk {
<br>&gt; +		compatible =3D &quot;fixed-clock&quot;;
<br>&gt; +		#clock-cells =3D &lt;0&gt;;
<br>&gt; +		clock-frequency =3D &lt;100000000&gt;;
<br>&gt; +		clock-output-names =3D &quot;sysclk&quot;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	reboot {
<br>&gt; +		compatible =3D&quot;syscon-reboot&quot;;
<br>&gt; +		regmap =3D &lt;&amp;dcfg&gt;;
<br>&gt; +		offset =3D &lt;0xb0&gt;;
<br>&gt; +		mask =3D &lt;0x02&gt;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	timer {
<br>&gt; +		compatible =3D &quot;arm,armv8-timer&quot;;
<br>&gt; +		interrupts =3D &lt;GIC_PPI 13 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt; +					  IRQ_TYPE_LEVEL_LOW)&gt;,
<br>&gt; +			     &lt;GIC_PPI 14 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt; +					  IRQ_TYPE_LEVEL_LOW)&gt;,
<br>&gt; +			     &lt;GIC_PPI 11 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt; +					  IRQ_TYPE_LEVEL_LOW)&gt;,
<br>&gt; +			     &lt;GIC_PPI 10 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt; +					  IRQ_TYPE_LEVEL_LOW)&gt;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	gic: interrupt-controller@1410000 {
<br>&gt; +		compatible =3D &quot;arm,gic-400&quot;;
<br>&gt; +		#interrupt-cells =3D &lt;3&gt;;
<br>&gt; +		interrupt-controller;
<br>&gt; +		reg =3D &lt;0x0 0x1410000 0 0x10000&gt;, /* GICD */
<br>&gt; +		      &lt;0x0 0x142f000 0 0x1000&gt;, /* GICC */
<br>&gt; +		      &lt;0x0 0x1440000 0 0x20000&gt;, /* GICH */
<br>&gt; +		      &lt;0x0 0x146f000 0 0x1000&gt;; /* GICV */
<br>&gt; +		interrupts =3D &lt;GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt; +					 IRQ_TYPE_LEVEL_LOW)&gt;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	soc: soc {
<br>&gt; +		compatible =3D &quot;simple-bus&quot;;
<br>&gt; +		#address-cells =3D &lt;2&gt;;
<br>&gt; +		#size-cells =3D &lt;2&gt;;
<br>&gt; +		ranges;
<br>&gt; +		dma-ranges =3D &lt;0x0 0x0 0x0 0x0 0x10000 0x00000000&gt;;
<br>&gt; +		dma-coherent;
<br>&gt; +
<br>&gt; +
<br>&gt; +		ddr: memory-controller@1080000 {
<br>&gt; +			compatible =3D &quot;fsl,qoriq-memory-controller&quot;;
<br>&gt; +			reg =3D &lt;0x0 0x1080000 0x0 0x1000&gt;;
<br>&gt; +			interrupts =3D &lt;GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH&gt;;
<br>&gt; +			big-endian;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +		scfg: scfg@1570000 {
<br>&gt; +			compatible =3D &quot;fsl,ls1046a-scfg&quot;, &quot;syscon&quot=
;;
<br>&gt; +			reg =3D &lt;0x0 0x1570000 0x0 0x10000&gt;;
<br>&gt; +			big-endian;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +		dcfg: dcfg@1ee0000 {
<br>&gt; +			compatible =3D &quot;fsl,ls1046a-dcfg&quot;, &quot;syscon&quot=
;;
<br>&gt; +			reg =3D &lt;0x0 0x1ee0000 0x0 0x1000&gt;;
<br>&gt; +			big-endian;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +		clockgen: clocking@1ee1000 {
<br>&gt; +			compatible =3D &quot;fsl,ls1046a-clockgen&quot;;
<br>&gt; +			reg =3D &lt;0x0 0x1ee1000 0x0 0x1000&gt;;
<br>&gt; +			#clock-cells =3D &lt;2&gt;;
<br>&gt; +			clocks =3D &lt;&amp;sysclk&gt;;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +		duart1: serial@21c0600 {
<br>&gt; +			compatible =3D &quot;fsl,ns16550&quot;, &quot;ns16550a&quot;;
<br>&gt; +			reg =3D &lt;0x00 0x21c0600 0x0 0x100&gt;;
<br>&gt; +			clocks =3D &lt;&amp;clockgen 4 1&gt;;
<br>&gt; +			status =3D &quot;okay&quot;;
<br>&gt; +		};
<br>&gt; +
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	pci@fb500000 {
<br>&gt; +		compatible =3D &quot;pci-host-ecam-generic&quot;;
<br>&gt; +		device_type =3D &quot;pci&quot;;
<br>&gt; +		bus-range =3D &lt;0 0&gt;;
<br>&gt; +		#address-cells =3D &lt;3&gt;;
<br>&gt; +		#size-cells =3D &lt;2&gt;;
<br>&gt; +		#interrupt-cells =3D &lt;1&gt;;
<br>&gt; +		interrupt-map-mask =3D &lt;0 0 0 7&gt;;
<br>&gt; +		interrupt-map =3D &lt;0 0 0 1 &amp;gic GIC_SPI 28 IRQ_TYPE_EDGE=
_RISING&gt;,
<br>&gt; +			&lt;0 0 0 2 &amp;gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING&gt;,
<br>&gt; +			&lt;0 0 0 3 &amp;gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING&gt;,
<br>&gt; +			&lt;0 0 0 4 &amp;gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING&gt;;
<br>&gt; +		reg =3D &lt;0x0 0xfb500000 0x0 0x100000&gt;;
<br>&gt; +		ranges =3D &lt;0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0=
x10000&gt;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +	psci {
<br>&gt; +		compatible =3D &quot;arm,psci-1.0&quot;;
<br>&gt; +		method =3D &quot;smc&quot;;
<br>&gt; +	};
<br>&gt; +
<br>&gt; +};
<br>&gt; +
<br>&gt;=20
<br>
<br>Both merged with minor tweaking.
<br>
<br>Thanks,
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/88b3f6d5-bbe5-44ae-bb14-639d5a4c5fe5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/88b3f6d5-bbe5-44ae-bb14-639d5a4c5fe5n%40googlegroups.co=
m</a>.<br />

------=_Part_2613_349598630.1607307360266--

------=_Part_2612_1138709890.1607307360266--
