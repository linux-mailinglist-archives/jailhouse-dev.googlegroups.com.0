Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRB5MN3SOQMGQEI77P2MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id B212D65F279
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 18:20:53 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id m38-20020a05600c3b2600b003d23f8c6ebdsf1590707wms.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 09:20:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672939253; cv=pass;
        d=google.com; s=arc-20160816;
        b=kQAFcmyWD9OmgcvgjukNx7UUov6X8FbF6SgjI9gyiigMHQcOuKUPeu9OLrEGH7xDBD
         Qb2VBYyf5FLFGuFXyws3NCjEXVow8xIOmczBGOlDf4HzRxB0IbfmNakg+QNoUacu5HZy
         Ryekwi27FVt4UDH0HigPEv2aCyj3RjmY+tmwPegTvJnv6BmsKXcX/kotjjA97YOMRsmS
         EuLHPF1ZWCrcVCDohdTTvxO+Bbv+4HagHgcf4TkUwTTvS7Um0bIo+WIThkqL2GqdAlXl
         Uh4mFmGCkYuZ8wi4CCrRDyG0bpH9aR0phBlWT9zd6ptVuZF3+PhNxf+tmf/55domifp6
         s2Pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=uud75K7r81defHT1cZJeVeh5PynFRRjRqy8ErWnDO5Y=;
        b=RsPTlov2/nGVRFaqjxPXYKF7MtQT13IWXSMt/puyNivXPhPhe0cVQcAeU+3Lw3mdFh
         /757T0iEIgAd9etLtoOP6QWCeDBUWNlQe3IWzLPCzxDeEvdhFWJrpKpl40TpOVlZ2qW2
         po2BpkuqyRv2ryxkxnnCbTgPBgKhQd4PeBIIZr2+GzRyUqf0+FSO2LOuqwVNCmroyUKw
         37cnwoMGBTPe1wDFO/jn3u8DI54VupiCXNhMhK6GHCEQ9TdbQSGvYpMXl07Qc4LpnRSx
         qia4ALx3MX4K2pagll2sBbKANf/CLLv9NRSm0f6LBShcbtcQsqbgfq+ZcivQYbOevA8A
         4/FA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SLeXsJcv;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::42d as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uud75K7r81defHT1cZJeVeh5PynFRRjRqy8ErWnDO5Y=;
        b=PXCzSaQEf5L6H19Tpn+m38Ezjx2LYxSl+VU3Eojxs6yZINSpyzOKHY/+vArYGVp8eo
         kmdbbnY7YQdWnbXx9hBrpzzZ/xf3BaPRKmwsxp/i5SsNX/3stsC2ruWpoAff4UMcpTbS
         cfPZ2Vcxa3+oxW2xjDnZLvfkiPmtjTczNqKsMGgyzUQ/EvXYCr8ellnG0Iaz64hlFAPp
         hxpebtYl52TEquIDmD1b5OsYYWiPtWI6w6uWRj49ntQ9DLYvx6Q8yKmB+tgJtXVVVIqS
         WyFqscsOmN2jc3pWxu1iMD2dd1OuWtssM+0USSN6spf+QR6XLs79r9s90/bJMJRZiDYI
         HXSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uud75K7r81defHT1cZJeVeh5PynFRRjRqy8ErWnDO5Y=;
        b=X/AzlIJM1DPpYbrN4jyuc50XSpZW3IHPMqA6zoCuwsFf0SpmMcmyBcpezXIH+563rJ
         3k1p3ZAFaqpVluzh6m/9LBtyhyChgIPKybKAN5IGNrB+Tl2aNud4sJqmTmJH/DN2MsvK
         YhCR0I/TQA8g2JYCqZeRSWJq/q5By+RCqCrJuSFLQJavYVlfopkNEPGYRsOaqfUhxWHd
         UZdTiXdmNAPVQ+5c1LRDlg/riMZ01f+DSvktUo7N0T9V3nOxBsoh8P7qvKvFqaYRaiit
         7DMOiUeK9torgsqYV+6kUeUrBvIS1dr+dcO7katvvB27T4cG6he3kE17gU/FYgA+6wT/
         w64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uud75K7r81defHT1cZJeVeh5PynFRRjRqy8ErWnDO5Y=;
        b=oAJyFHHvPBwRgBoYoMdbrKLrK98Ispur+amCYFhx7bLDDnIM24xkHlSaXrA4Cd46wS
         AQnNtNJlO/XFWQ5N0mDa/1uAL3e60d5ofXdfq+qgEzOXr1zAxOwZbFnplGESNZTDGPQ7
         kp2bLDWJQPpAsmY0dLLALb7LdBr25EDTB5wMHjAE0anNfLGD/SlXKZZ6igP5VCIKSXR9
         wsKPj6cTuqTmrA5YviRf8s6r6JONnJ3+V7QqLGfQXYfIjXnlQ3E/hM/+kkGZs7Tysl8R
         Xh8QmZQQR2wKo0YBSyV7FC0oPEpcOwN+35cU+rqbpUdaRorI1c5yFEueLF5rU9Gvx6pY
         QkjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqn8/uik9Ssb43VIX59eK2g+VtcwdjWfgmQXzwCuBwsWoyw+vDn
	NYgNJDyBVgRT16w8yL+l61o=
X-Google-Smtp-Source: AMrXdXsZoagT5dJk0p1KuVTzEv++0XEBH4W7l9mBtBSKTjlZAiW2PmK5G2BprXZlxFLVa4aO2BYH9g==
X-Received: by 2002:adf:e18a:0:b0:29c:a960:2d6c with SMTP id az10-20020adfe18a000000b0029ca9602d6cmr559398wrb.544.1672939253450;
        Thu, 05 Jan 2023 09:20:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:170c:b0:225:6559:3374 with SMTP id
 n12-20020a056000170c00b0022565593374ls2411970wrc.2.-pod-prod-gmail; Thu, 05
 Jan 2023 09:20:52 -0800 (PST)
X-Received: by 2002:adf:e303:0:b0:242:1926:783c with SMTP id b3-20020adfe303000000b002421926783cmr32565826wrj.58.1672939252007;
        Thu, 05 Jan 2023 09:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939251; cv=none;
        d=google.com; s=arc-20160816;
        b=oQOQ3ktWUxrcf2AkMxt4dNDw+jo2nhajR7J5aNSXm0E1nii3Yi/nE4dG3mn/pkiqYB
         SWLsX5k8zoBuIvrZa14uGewtAtSWxn+Ag4iK9N7UjNV4DUDJdT+e7GGFViuo9fy+wAxV
         o+aikqYfsim9znLjIjyZPuY5M/l20VSdapQabGC3jk9ahMYUysltjvKhG8g+kKuDT+OI
         R4yFF1mBp16HjMI96URIbcoIGM211/HPMnqqEWi/7kShZnvUTaaYUF1cNSgEaRaosDKy
         UiC4IV0EJcRXh/B9i+EvpQfGogG7ulPdCdK18fcEofELyxA25DECPrCacHWhn4BIiURu
         yyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nkqmyv0q7Eg5KGsH9OXMFkK1bsk23U5lK7N8p9XJTN0=;
        b=Yl43kXs42LaxJXHEzNrYUP1Vg3I+ricxAh82PRX0IfGgR4DYo9VRmPvkDKr4sp0NHI
         M8flLfJbt3AlpyR2CxEv6A1KKqxH5+U4s2dvK3KkEXlAKzpQMULGIbuO3aTUuJzvuRfc
         WxBpdSxmc0+kNQCnDIqUS7lsuvFI8CIXPLa4dQq3WNuN75OPeC0IovroakFGLCOkvuBX
         nu0qxxF/N/DFlMFfqvSHx0nFe0D7SsereTHZTKvSDFOY0FGyYt+I8LnHAryIyPbo8MLM
         teuf50bJzerqk9SVcu3r2QbDwVF2DpgzqK4OsweJht/Pg8ba1elvjWQOmvT9SiqisxcD
         Ui4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SLeXsJcv;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::42d as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com. [2a00:1450:4864:20::42d])
        by gmr-mx.google.com with ESMTPS id u5-20020a056000038500b0029c9b8d8aafsi354623wrf.6.2023.01.05.09.20.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::42d as permitted sender) client-ip=2a00:1450:4864:20::42d;
Received: by mail-wr1-x42d.google.com with SMTP id bn26so17337166wrb.0
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Jan 2023 09:20:51 -0800 (PST)
X-Received: by 2002:a05:6000:50e:b0:242:3d08:1c08 with SMTP id
 a14-20020a056000050e00b002423d081c08mr1089193wrf.415.1672939251453; Thu, 05
 Jan 2023 09:20:51 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com> <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com> <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
In-Reply-To: <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Thu, 5 Jan 2023 12:20:40 -0500
Message-ID: <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000d051e205f18785e1"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=SLeXsJcv;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::42d as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000d051e205f18785e1
Content-Type: text/plain; charset="UTF-8"

Jan - Just ran the config check on the host PC and on target.

1. On host, it identified some memregion overlappings that were due my own
copy/paste errors. It also complained a missing resource interception for
architecture x86:









*In cell 'STM32MP1-Root', region 1  phys_start: 0x00000000f7600000
virt_start: 0x00000000f7600000  size:       0x0000000009a00000  flags:
 JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTEoverlaps
with xAPIC  phys_start: 0x00000000fee00000  virt_start: 0x00000000fee00000
size:       0x0000000000001000  flags:  *
I fixed the copy paste mem overlappings, do I need to worry about the xAPIC
overlapping?

2. On target, the check complained the configuration is not root cell
configuration???


*root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
jailhouse/configs/stm32mp157.cReading configuration set:Not a root cell
configuration: jailhouse/configs/arm/stm32mp157.c*
The config here is the same as ran on the host PC. What causes it to
complain the above?

to 5. tammik. 2023 klo 11.55 Jan Kiszka (jan.kiszka@siemens.com) kirjoitti:

> On 05.01.23 17:53, Tommi Parkkila wrote:
> > Jan - Thanks again. I have not tried the config check yet. Actually, it
> > does not work on hw currently, it does not find pyjailhouse module. I'll
> > check whats going wrong with it and let you know.
>
> You can also run it offline, even directly from the source folder
> (tools/jailhouse-config-check ...).
>
> Jan
>
> > -tommi
> >
> > to 5. tammik. 2023 klo 10.21 Jan Kiszka (jan.kiszka@siemens.com
> > <mailto:jan.kiszka@siemens.com>) kirjoitti:
> >
> >     On 05.01.23 15:34, Tommi Parkkila wrote:
> >     > Thanks for your reply, Jan. I managed to get forward from the
> 'hang'
> >     > condition. There were several misdefinitions on my root-cell
> >     > configuration. Now I get the root-cell started sometimes, but more
> >     often
> >     > I get two types of issues after enable command. Any help or ideas
> >     where
> >     > to continue my debugging would be greatly appreciated. Please, see
> the
> >     > issues explained below.
> >
> >     Already tried "jailhouse config check"?
> >
> >     >
> >     > Thanks,
> >     > -tommi
> >     >
> >     > +++++++++++++++++++++++++++++++++
> >     >
> >     > 1. Terminal hangs
> >     > -- After the enable command for the root cell, jailhouse gets
> started
> >     > but then the terminal goes unresponsive. Below, example log, where
> I
> >     > give ls cmd, which then causes terminal to go unresponsive...:
> >     >
> >
> >     Missing interrupts could be one reason. Or something is completely
> >     broken with memory mapping so that a kernel device driver gets stuck
> on
> >     waiting for some register bit to flip, e.g. But most frequent are
> >     interrupt issues, specifically around GIC resources being improperly
> >     passed through. The config checker may find that.
> >
> >     > /*root@stm32mp1:~# modprobe jailhouse
> >     > [ 1315.034414] jailhouse: loading out-of-tree module taints kernel.
> >     > root@stm32mp1:~# jailhouse enable
> >     > ~/jailhouse/configs/arm/itron_stm32mp157.cell
> >     >
> >     > Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on
> CPU 0
> >     > Code location: 0xf0000040
> >     > Page pool usage after early setup: mem 28/1514, remap 0/131072
> >     > Initializing processors:
> >     >  CPU 0... OK
> >     >  CPU 1... OK
> >     > Initializing unit: irqchip
> >     > Initializing unit: PCI
> >     > Page pool usage after late setup: mem 50/1514, remap 5/131072
> >     > [0] Activating hypervisor
> >     > [ 1355.352714] The Jailhouse is opening.
> >     > root@stm32mp1:~# ls*/
> >     >
> >     > 2. Issue with setting CPU clock
> >     > -- The second issue I see is related to i2c bus and system clock.
> >     > Terminal starts printing error statements infinitely after
> Jailhouse
> >     > opening. Below, is a snippet of an example logs.
> >     >
> >     > */[   85.322027] The Jailhouse is opening.
> >     > [   85.322648] stm32f7-i2c 5c002000.i2c: failed to prepare_enable
> >     clock
> >     > root@stm32mp1:~# [   85.339233] cpu cpu0: _set_opp_voltage:
> failed to
> >     > set voltage (1350000 1350000 1350000 mV): -22
> >     > [   85.350413] cpufreq: __target_index: Failed to change cpu
> >     frequency: -22
> >     > [   85.357706] cpu cpu0: _set_opp_voltage: failed to set voltage
> >     > (1350000 1350000 1350000 mV): -22
> >     > [   85.365124] cpufreq: __target_index: Failed to change cpu
> >     frequency: -22
> >     > [   85.381985] cpu cpu0: _set_opp_voltage: failed to set voltage
> >     > (1350000 1350000 1350000 mV): -22
> >     > /*- - -
> >     > +++++++++++++++++++++++++++++++++
> >
> >     Same possible reasons as above. Or do you know how clock control
> happens
> >     on that platform? Is there firmware (TF-A?) involved?
> >
> >     Jan
> >
> >     --
> >     Siemens AG, Technology
> >     Competence Center Embedded Linux
> >
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAP8Rr628BM-8rQR%2BK4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A%40mail.gmail.com.

--000000000000d051e205f18785e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jan - Just ran the config check on the host PC and on targ=
et.=C2=A0<div><br></div><div>1. On host, it identified some memregion overl=
appings that were due my own copy/paste errors. It also complained a missin=
g resource interception for architecture x86:<div><b><i>In cell &#39;STM32M=
P1-Root&#39;, region 1<br>=C2=A0 phys_start: 0x00000000f7600000<br>=C2=A0 v=
irt_start: 0x00000000f7600000<br>=C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x000000=
0009a00000<br>=C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_MEM_READ | JAILHO=
USE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE<br>overlaps with xAPIC<br>=C2=A0 phys=
_start: 0x00000000fee00000<br>=C2=A0 virt_start: 0x00000000fee00000<br>=C2=
=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000000001000<br>=C2=A0 flags:=C2=A0=C2=
=A0</i></b><br></div></div><div>I fixed the copy paste mem=C2=A0overlapping=
s, do I need to worry about the xAPIC overlapping?</div><div><b><i><br></i>=
</b></div><div>2. On target, the check complained the configuration is not =
root cell configuration???</div><div><b><i>root@stm32mp1:~# jailhouse/tools=
/jailhouse-config-check jailhouse/configs/stm32mp157.c<br>Reading configura=
tion set:<br>Not a root cell configuration: jailhouse/configs/arm/stm32mp15=
7.c</i></b><br></div><div>The config here is the same as ran on the host PC=
. What causes it to complain the above?</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">to 5. tammik. 2023 klo 11.55 J=
an Kiszka (<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com=
</a>) kirjoitti:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 05.01.23 17:53, Tommi Parkkila wrote:<br>
&gt; Jan - Thanks again. I have not tried the config check yet. Actually, i=
t<br>
&gt; does not work on hw currently, it does not find pyjailhouse module. I&=
#39;ll<br>
&gt; check whats=C2=A0going wrong with it and=C2=A0let you know.<br>
<br>
You can also run it offline, even directly from the source folder<br>
(tools/jailhouse-config-check ...).<br>
<br>
Jan<br>
<br>
&gt; -tommi<br>
&gt; <br>
&gt; to 5. tammik. 2023 klo 10.21 Jan Kiszka (<a href=3D"mailto:jan.kiszka@=
siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank"=
>jan.kiszka@siemens.com</a>&gt;) kirjoitti:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05.01.23 15:34, Tommi Parkkila wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks for your reply, Jan. I managed to get f=
orward from the &#39;hang&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; condition. There were several misdefinitions o=
n my root-cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; configuration. Now I get the root-cell started=
 sometimes, but more<br>
&gt;=C2=A0 =C2=A0 =C2=A0often<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I get two types of issues after enable command=
. Any help or ideas<br>
&gt;=C2=A0 =C2=A0 =C2=A0where<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to continue my debugging would be greatly appr=
eciated. Please, see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; issues explained below.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Already tried &quot;jailhouse config check&quot;?<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -tommi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Terminal hangs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -- After the enable command for the root cell,=
 jailhouse gets started<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; but then the terminal goes unresponsive. Below=
, example log, where I<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; give ls cmd, which then causes terminal to go =
unresponsive...:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Missing interrupts could be one reason. Or somethin=
g is completely<br>
&gt;=C2=A0 =C2=A0 =C2=A0broken with memory mapping so that a kernel device =
driver gets stuck on<br>
&gt;=C2=A0 =C2=A0 =C2=A0waiting for some register bit to flip, e.g. But mos=
t frequent are<br>
&gt;=C2=A0 =C2=A0 =C2=A0interrupt issues, specifically around GIC resources=
 being improperly<br>
&gt;=C2=A0 =C2=A0 =C2=A0passed through. The config checker may find that.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /*root@stm32mp1:~# modprobe jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1315.034414] jailhouse: loading out-of-tree =
module taints kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# jailhouse enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ~/jailhouse/configs/arm/itron_stm32mp157.cell<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing Jailhouse hypervisor v0.12 (314-g=
c7a1b697-dirty) on CPU 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Code location: 0xf0000040<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after early setup: mem 28/1514=
, remap 0/131072<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing processors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0CPU 0... OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0CPU 1... OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: irqchip<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: PCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after late setup: mem 50/1514,=
 remap 5/131072<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [0] Activating hypervisor<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1355.352714] The Jailhouse is opening.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# ls*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. Issue with setting CPU clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -- The second issue I see is related to i2c bu=
s and system clock.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Terminal starts printing error statements infi=
nitely after Jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; opening. Below, is a snippet of an example log=
s.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; */[ =C2=A0 85.322027] The Jailhouse is opening=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: =
failed to prepare_enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0:=
 _set_opp_voltage: failed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; set voltage (1350000 1350000 1350000 mV): -22<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.350413] cpufreq: __target_index: F=
ailed to change cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0frequency: -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage=
: failed to set voltage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.365124] cpufreq: __target_index: F=
ailed to change cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0frequency: -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.381985] cpu cpu0: _set_opp_voltage=
: failed to set voltage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /*- - -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Same possible reasons as above. Or do you know how =
clock control happens<br>
&gt;=C2=A0 =C2=A0 =C2=A0on that platform? Is there firmware (TF-A?) involve=
d?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Technology<br>
&gt;=C2=A0 =C2=A0 =C2=A0Competence Center Embedded Linux<br>
&gt; <br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr628BM-8rQR%2BK4gw2GFPHZZXgVvbtdNF90fpyXU9Nxs=
x1A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAP8Rr628BM-8rQR%2BK4gw2GFPHZZXgVvbtdNF90=
fpyXU9Nxsx1A%40mail.gmail.com</a>.<br />

--000000000000d051e205f18785e1--
