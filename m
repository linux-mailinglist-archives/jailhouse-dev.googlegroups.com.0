Return-Path: <jailhouse-dev+bncBDS77PFL3YERBUV3YOCQMGQE6DAF5GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id E164C394252
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 May 2021 14:10:59 +0200 (CEST)
Received: by mail-pj1-x103e.google.com with SMTP id ot13-20020a17090b3b4db029015d9ead4bc5sf2623747pjb.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 May 2021 05:10:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622203858; cv=pass;
        d=google.com; s=arc-20160816;
        b=kzV9dDbLxqap8L1NOCy4fxCdSKq0F4NU1PsqDWvPbS3a+mEfvYFQVuIDuqw/r/6gfN
         IW05OkKEC3NCGnaWHSaDQ89MWryOgwPt8k+CpM9TwDD7l9vfq55tJD456eL6RRAh47Q5
         Yc36H2/SsQH8RI/CTj2GvL6jIwhSybOl2lk71C4xTIB8W8wCQPLsTBnKvbt4cOXyDSuZ
         e+G61yB+qv+aMmzW18PIbzy1C6m+WVNmI+NLPJtAB7bW+pajdvVqaqoZ/1Xilj8J0ihC
         JokL4ATGgAXtJYTArt27dOExDU84S3n+YO9bfJPBGQhSSirYVb2Sx+n1Qk2M5squVgIu
         qA9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=uebtgMWA81p9Rpzx/v4sOS3yfbB7EvpBIbILEmldPDc=;
        b=kX/quCZ8R1dPkFGdod2JNS01fuePMM9rQvo6pv3zDT1b5DxM6bsKl0cVnen8AoMlTV
         mEzfwo1rOUzo47NRJR1QQx7SnvzQ60Os8bYbi30U3IK/eWYLhqqszrraaDB1oKkVp7XE
         XBTfJcPvrsFKvcM4DFzvVKqXQVZsBEk0BgOIqDlc16K6mzs/mX55y3uwkmGFRsFSdEXn
         B2TZ0qEr3t0UJk9gheTfiMmV5iJmf9kfAfmgNA9hMtAE63krqm7ULNjmvwNJAM81QxrE
         LwfTLVc9nkWi2YMSZzjiz5usZdghi7zyrASW5mvrtRCzu36sXTRoaVlBTYFMOkeqYi42
         7GtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=usf0OgSo;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::633 as permitted sender) smtp.mailfrom=pkali@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uebtgMWA81p9Rpzx/v4sOS3yfbB7EvpBIbILEmldPDc=;
        b=XOjgL11lmO7EDxtbdyqiCwkUPrxo3PSCGxyCgvheYcnVETDHggIVwbbR7ILti3cpPX
         q7tyIcG7k4eMq+zwcamfA02YIM2P/sAN93Xq4U7h+ndga6pOxfPIxuX30CNevlmezG5A
         Bg/hGA39ykQvy0eKxcG9KoSAir2vKAp+8hFxRz33u1Y44OruOky07MjUo4DRw4xy/DzN
         Y9zZwRMmDdrm2wGtFxKLToyxRsEz3gHrdTxtTqBWJAWr37rwr/Jel3oXE2liy5F07Zqo
         edarPELrgk4aIgty9+cLDL9PSkViq8GsN9gWSu5Fa3nT9zRn3kqEOKxAAsSG3g5RmlyM
         omhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uebtgMWA81p9Rpzx/v4sOS3yfbB7EvpBIbILEmldPDc=;
        b=CCOaSQjKES59GsG14lQryEpIVbVrdr27aFHzrtbJUaqSNK9p+brwalCGSadJ36EMg9
         ls8krT6p+dVVcAyWYk52skqakuZPX36MeeGyZM2uhmKGwyDonpEtzpKjtQsTOM5Aawgf
         LbqrluMPqWGfKjWC238J8dqsiNKOLH3SzB3UGsz4wWJbim2LqIkwBBEv9G9PNwEMkeTj
         MLHYxpwt/pedr0azKgyDzZL710+zfaXZ3ZTrV2PnBZ/Ir54Fk/jk5wuiWfbXw9d3srBW
         b6IfOOmS+jTI+CBbO+fKhlvH5rxt+QBOyKx5KJ/H9QvregNyYOXXayuPFCqMQaKmXSIR
         ZnQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+D0cCU/ZVip1/f29IiPbQm21JeqTV/NN++HCuu/ap6MPcoMI6
	4thj0mnmc4R06m7T0uJ2Klo=
X-Google-Smtp-Source: ABdhPJwcwyPB26hcG99a6V84NimAeCIDKYbDeMU1aHVe9S9R5KVJbC70jlbikXuweJRgcKkr1WWA3w==
X-Received: by 2002:a17:90a:5d18:: with SMTP id s24mr817340pji.188.1622203858358;
        Fri, 28 May 2021 05:10:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:5f09:: with SMTP id t9ls3183276pgb.0.gmail; Fri, 28 May
 2021 05:10:57 -0700 (PDT)
X-Received: by 2002:a62:8705:0:b029:2d9:5420:a1b5 with SMTP id i5-20020a6287050000b02902d95420a1b5mr3518169pfe.45.1622203857739;
        Fri, 28 May 2021 05:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622203857; cv=none;
        d=google.com; s=arc-20160816;
        b=YBHvT54i6gcquPHI0E5/ZL2V3k5o2GKp9Cr3QWAt16XNKt18atGBRUV4dcM/wb3nye
         DSZiLYw9dJ6EGnqof1FXkTYZ60vLMeiIxFtXYpwvI2fYWiUCsXk/hZraLFfuw1OwwJIM
         P9lhz7xGIcmSv8MPap/dhiy56qWHcOwhQevaSfZbjdmteSVV2mywfEEG31fr1618W1Hh
         BVafngHPBtYqxPM9t4uTIGCusC/F5Tn3+djCXVMBe5Yl9telKBXs4uN+1yvIvDQR6LzQ
         KqE7DnLVwRZarv/YkyWgeVIGYst9PGimY11j5cXrGt7HOh0sMK8MydT7atIRGahz5XhK
         kOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-signature;
        bh=TfTkwvdAEDG7iA6Vtgvu7ncu200csu1pQ5xBzHjVJXA=;
        b=fRoBSAmuZ+CJV+YoCBZ759LLxQ19V3p7uWFF1rqV1B6xfdW58zx4lwNU4JWUuApLKA
         sVwrXlaklf+0KKmfltQVKUk+wxvaoLNNzPZsWH76q91JPQxcpfOYd7SplKo6JUpaWNtQ
         ZDaTOZKq5xmmverJEO/DMpyqeFGZk6fLWivX47rMkufN9A/rc3Go1TnqJb/HhxNxTk/e
         UE560v8MVVVSHoOcv4UPhnypPjcX4byKwef6AEEEwNeIJ3oXGfOnN5+4CD+GNV0dFl96
         +iBEfSELlazRtG3axuOx80Oz+DPmzXvCF/HrGsxHovTBLxVUiNiscXpjaMzYDJ+ma+to
         d9yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=usf0OgSo;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::633 as permitted sender) smtp.mailfrom=pkali@cimware.in
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com. [2607:f8b0:4864:20::633])
        by gmr-mx.google.com with ESMTPS id p50si431736pfw.4.2021.05.28.05.10.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 05:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::633 as permitted sender) client-ip=2607:f8b0:4864:20::633;
Received: by mail-pl1-x633.google.com with SMTP id z4so1524929plg.8
        for <jailhouse-dev@googlegroups.com>; Fri, 28 May 2021 05:10:56 -0700 (PDT)
X-Received: by 2002:a17:902:ea0c:b029:f0:af3d:c5d6 with SMTP id s12-20020a170902ea0cb02900f0af3dc5d6mr7679035plg.45.1622203856233;
        Fri, 28 May 2021 05:10:56 -0700 (PDT)
Received: from Administrators-MacBook-Pro.local ([115.99.119.32])
        by smtp.gmail.com with ESMTPSA id 13sm4390400pfz.91.2021.05.28.05.10.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 05:10:55 -0700 (PDT)
To: jailhouse-dev@googlegroups.com
From: Prashant Kalikotay <pkali@cimware.in>
Subject: Writing configuration files
Message-ID: <989156a0-b5d6-7672-a109-9860c5f94867@cimware.in>
Date: Fri, 28 May 2021 17:40:57 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------F1B44F791221DCCB503AEB65"
Content-Language: en-US
X-Original-Sender: pkali@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=usf0OgSo;       spf=pass (google.com: domain of pkali@cimware.in
 designates 2607:f8b0:4864:20::633 as permitted sender) smtp.mailfrom=pkali@cimware.in
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

This is a multi-part message in MIME format.
--------------F1B44F791221DCCB503AEB65
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Dear all,

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am tr=
ying to write configuration files for the root and=20
the non-root cells for an arm64 based system. I have checked the video=20
https://youtu.be/7fiJbwmhnRw and also the pdf. I could just infer from=20
these that I have to write the config files using the already existing=20
ones eg: amd-seatle.c and other files. But what I am not able to=20
understand is how do I come up with the different values in the config=20
files as in other files.

For Example:

This is small portion of amd-seattle.c how do we come up with the values=20
in the mem_regions[] as 20, irqchips[] as 3, hypervisor_memory.=20
phys_start =3D 0x83e0000000, and all othe r values in the config files.=20
Which document has been used. Any pointer to any of the documents of the=20
various config files listed in the configs would be a lot helpful.


#include <jailhouse/types.h>

	#include <jailhouse/cell-config.h>

=09

	struct {

	struct jailhouse_system header;

	__u64 cpus[1];

	struct jailhouse_memory mem_regions[20];

	struct jailhouse_irqchip irqchips[3];

	struct jailhouse_pci_device pci_devices[3];

	} __attribute__((packed)) config =3D {

	.header =3D {

	.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,

	.revision =3D JAILHOUSE_CONFIG_REVISION,

	.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,

	.hypervisor_memory =3D {

	.phys_start =3D 0x83e0000000,

	.size =3D 0x4000000,

	},

	.debug_console =3D {

	.address =3D 0xe1010000,

	.size =3D 0x1000,

	.type =3D JAILHOUSE_CON_TYPE_PL011,

	.flags =3D JAILHOUSE_CON_ACCESS_MMIO |

	JAILHOUSE_CON_REGDIST_4,

	},

=09

=09

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/989156a0-b5d6-7672-a109-9860c5f94867%40cimware.in.

--------------F1B44F791221DCCB503AEB65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Dear all,</p>
    <p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=
 am trying to write configuration files for the root
      and the non-root cells for an arm64 based system. I have checked
      the video <a class=3D"moz-txt-link-freetext" href=3D"https://youtu.be=
/7fiJbwmhnRw">https://youtu.be/7fiJbwmhnRw</a> and also the pdf. I could
      just infer from these that I have to write the config files using
      the already existing ones eg: amd-seatle.c and other files. But
      what I am not able to understand is how do I come up with the
      different values in the config files as in other files. <br>
    </p>
    <p>For Example:</p>
    <p>This is small portion of amd-seattle.c how do we come up with the
      values in the mem_regions[] as 20, irqchips[] as 3,
      hypervisor_memory. phys_start =3D <span class=3D"pl-c1"
        style=3D"box-sizing: border-box; color:
        var(--color-prettylights-syntax-constant);">0x83e0000000, and
        all othe r values in the config files. Which document has been
        used. Any pointer to any of the documents of the various config
        files listed in the configs would be a lot helpful.</span></p>
    <p><span class=3D"pl-c1" style=3D"box-sizing: border-box; color:
        var(--color-prettylights-syntax-constant);"> <br>
      </span></p>
    <table class=3D"highlight tab-size js-file-line-container"
      data-tab-size=3D"8" data-paste-markdown-skip=3D"" style=3D"box-sizing=
:
      border-box; border-spacing: 0px; border-collapse: collapse; color:
      rgb(36, 41, 46); font-family: -apple-system, system-ui,
      &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple
      Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; text-align: start; text-transform: none; white-space:
      normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-thickness:
      initial; text-decoration-style: initial; text-decoration-color:
      initial;" width=3D"561" height=3D"432">
      <tbody style=3D"box-sizing: border-box;">
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"LC15" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">#<span class=3D"pl-k" style=3D"box-sizing: border-box; color: var=
(--color-prettylights-syntax-keyword);">include</span> <span class=3D"pl-s"=
 style=3D"box-sizing: border-box; color: var(--color-prettylights-syntax-st=
ring);"><span class=3D"pl-pds" style=3D"box-sizing: border-box; color: var(=
--color-prettylights-syntax-string);">&lt;</span>jailhouse/types.h<span cla=
ss=3D"pl-pds" style=3D"box-sizing: border-box; color: var(--color-prettylig=
hts-syntax-string);">&gt;</span></span></td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L16" class=3D"blob-num js-line-number"
            data-line-number=3D"16" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC16" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">#<span class=3D"pl-k" style=3D"box-sizing: border-box; color: var=
(--color-prettylights-syntax-keyword);">include</span> <span class=3D"pl-s"=
 style=3D"box-sizing: border-box; color: var(--color-prettylights-syntax-st=
ring);"><span class=3D"pl-pds" style=3D"box-sizing: border-box; color: var(=
--color-prettylights-syntax-string);">&lt;</span>jailhouse/cell-config.h<sp=
an class=3D"pl-pds" style=3D"box-sizing: border-box; color: var(--color-pre=
ttylights-syntax-string);">&gt;</span></span></td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L17" class=3D"blob-num js-line-number"
            data-line-number=3D"17" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC17" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">
</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L18" class=3D"blob-num js-line-number"
            data-line-number=3D"18" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC18" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;"><span class=3D"pl-k" style=3D"box-sizing: border-box; color: var(=
--color-prettylights-syntax-keyword);">struct</span> {</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L19" class=3D"blob-num js-line-number"
            data-line-number=3D"19" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC19" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">	<span class=3D"pl-k" style=3D"box-sizing: border-box; color: var=
(--color-prettylights-syntax-keyword);">struct</span> jailhouse_system head=
er;</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L20" class=3D"blob-num js-line-number"
            data-line-number=3D"20" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC20" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">	__u64 cpus[<span class=3D"pl-c1" style=3D"box-sizing: border-box=
; color: var(--color-prettylights-syntax-constant);">1</span>];</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L21" class=3D"blob-num js-line-number"
            data-line-number=3D"21" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC21" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">	<span class=3D"pl-k" style=3D"box-sizing: border-box; color: var=
(--color-prettylights-syntax-keyword);">struct</span> jailhouse_memory mem_=
regions[<span class=3D"pl-c1" style=3D"box-sizing: border-box; color: var(-=
-color-prettylights-syntax-constant);">20</span>];</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L22" class=3D"blob-num js-line-number"
            data-line-number=3D"22" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC22" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">	<span class=3D"pl-k" style=3D"box-sizing: border-box; color: var=
(--color-prettylights-syntax-keyword);">struct</span> jailhouse_irqchip irq=
chips[<span class=3D"pl-c1" style=3D"box-sizing: border-box; color: var(--c=
olor-prettylights-syntax-constant);">3</span>];</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L23" class=3D"blob-num js-line-number"
            data-line-number=3D"23" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC23" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">	<span class=3D"pl-k" style=3D"box-sizing: border-box; color: var=
(--color-prettylights-syntax-keyword);">struct</span> jailhouse_pci_device =
pci_devices[<span class=3D"pl-c1" style=3D"box-sizing: border-box; color: v=
ar(--color-prettylights-syntax-constant);">3</span>];</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L24" class=3D"blob-num js-line-number"
            data-line-number=3D"24" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC24" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">} __attribute__((packed)) config =3D {</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L25" class=3D"blob-num js-line-number"
            data-line-number=3D"25" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC25" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">	.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color: =
var(--color-prettylights-syntax-storage-modifier-import);">header</span> =
=3D {</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L26" class=3D"blob-num js-line-number"
            data-line-number=3D"26" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC26" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color:=
 var(--color-prettylights-syntax-storage-modifier-import);">signature</span=
> =3D JAILHOUSE_SYSTEM_SIGNATURE,</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L27" class=3D"blob-num js-line-number"
            data-line-number=3D"27" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC27" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color:=
 var(--color-prettylights-syntax-storage-modifier-import);">revision</span>=
 =3D JAILHOUSE_CONFIG_REVISION,</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L28" class=3D"blob-num js-line-number"
            data-line-number=3D"28" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC28" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color:=
 var(--color-prettylights-syntax-storage-modifier-import);">flags</span> =
=3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L29" class=3D"blob-num js-line-number"
            data-line-number=3D"29" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC29" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color:=
 var(--color-prettylights-syntax-storage-modifier-import);">hypervisor_memo=
ry</span> =3D {</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L30" class=3D"blob-num js-line-number"
            data-line-number=3D"30" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC30" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">			.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color=
: var(--color-prettylights-syntax-storage-modifier-import);">phys_start</sp=
an> =3D <span class=3D"pl-c1" style=3D"box-sizing: border-box; color: var(-=
-color-prettylights-syntax-constant);">0x83e0000000</span>,</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L31" class=3D"blob-num js-line-number"
            data-line-number=3D"31" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC31" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">			.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color=
: var(--color-prettylights-syntax-storage-modifier-import);">size</span> =
=3D          <span class=3D"pl-c1" style=3D"box-sizing: border-box; color: =
var(--color-prettylights-syntax-constant);">0x4000000</span>,</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L32" class=3D"blob-num js-line-number"
            data-line-number=3D"32" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC32" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		},</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L33" class=3D"blob-num js-line-number"
            data-line-number=3D"33" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC33" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color:=
 var(--color-prettylights-syntax-storage-modifier-import);">debug_console</=
span> =3D {</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L34" class=3D"blob-num js-line-number"
            data-line-number=3D"34" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC34" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">			.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color=
: var(--color-prettylights-syntax-storage-modifier-import);">address</span>=
 =3D <span class=3D"pl-c1" style=3D"box-sizing: border-box; color: var(--co=
lor-prettylights-syntax-constant);">0xe1010000</span>,</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L35" class=3D"blob-num js-line-number"
            data-line-number=3D"35" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC35" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">			.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color=
: var(--color-prettylights-syntax-storage-modifier-import);">size</span> =
=3D <span class=3D"pl-c1" style=3D"box-sizing: border-box; color: var(--col=
or-prettylights-syntax-constant);">0x1000</span>,</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L36" class=3D"blob-num js-line-number"
            data-line-number=3D"36" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC36" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">			.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color=
: var(--color-prettylights-syntax-storage-modifier-import);">type</span> =
=3D JAILHOUSE_CON_TYPE_PL011,</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L37" class=3D"blob-num js-line-number"
            data-line-number=3D"37" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC37" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">			.<span class=3D"pl-smi" style=3D"box-sizing: border-box; color=
: var(--color-prettylights-syntax-storage-modifier-import);">flags</span> =
=3D JAILHOUSE_CON_ACCESS_MMIO |</td>
        </tr>
        <tr style=3D"box-sizing: border-box; background-color: initial;">
          <td id=3D"L38" class=3D"blob-num js-line-number"
            data-line-number=3D"38" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC38" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">				 JAILHOUSE_CON_REGDIST_4,</td>
        </tr>
        <tr style=3D"box-sizing: border-box;">
          <td id=3D"L39" class=3D"blob-num js-line-number"
            data-line-number=3D"39" style=3D"box-sizing: border-box;
            padding: 0px 10px; width: 50px; min-width: 50px;
            font-family: SFMono-Regular, Consolas, &quot;Liberation
            Mono&quot;, Menlo, monospace; font-size: 12px; line-height:
            20px; color: var(--color-diff-blob-num-text); text-align:
            right; white-space: nowrap; vertical-align: top; cursor:
            pointer; user-select: none;"><br>
          </td>
          <td id=3D"LC39" class=3D"blob-code blob-code-inner js-file-line" =
style=3D"box-sizing: border-box; padding: 0px 10px; position: relative; lin=
e-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono=
-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-siz=
e: 12px; color: var(--color-text-primary); overflow-wrap: normal; white-spa=
ce: pre;">		},

</td>
        </tr>
        <tr>
          <td valign=3D"top"><br>
          </td>
          <td valign=3D"top"><br>
          </td>
        </tr>
        <tr>
          <td valign=3D"top"><br>
          </td>
          <td valign=3D"top"><br>
          </td>
        </tr>
      </tbody>
    </table>
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
om/d/msgid/jailhouse-dev/989156a0-b5d6-7672-a109-9860c5f94867%40cimware.in?=
utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/j=
ailhouse-dev/989156a0-b5d6-7672-a109-9860c5f94867%40cimware.in</a>.<br />

--------------F1B44F791221DCCB503AEB65--
