Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBJFT7DZQKGQE5AVGH5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id A40601959A2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 16:20:06 +0100 (CET)
Received: by mail-pl1-x637.google.com with SMTP id 2sf7136261plb.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 08:20:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585322405; cv=pass;
        d=google.com; s=arc-20160816;
        b=RPmV5pld0hGwdxGh3kglbzZc9Nyujw0Clp3PJVeq/3PljCmNnxqzd7tp3qggrIUNoY
         XQ45piVRA/vdioTgjAnaNuEiaaHCvzelJhrZAdMvdXSIy9fLWupajCgTISjFat+jvrrN
         ZUf4gXvqScFF1id3Epf4SuChFQ4yeuo9nwOxdNST9QLGJzwDhSJn1fAEn2LHfOiAPpRO
         v9QZIhmPe4f/tBGn+93H1ptXt3yE4Z+a2t0+Q4LeEFKYQsfQPS70xZhUIRnDOo4XQCw8
         vCzxK8CZ7MSjm7WLAchVtiXX18xpM4nsU/006hiFqLmtCd54arH8NaLHkztpfQy6sPuP
         hCvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=afErd2G59aKAf1Us+M5STerUyHDvBki7AWawvlRlxbY=;
        b=L4FLzpeIxJlFmHXTNGDMLR1I0n9JgFN2BMtWVdtb7imWichP6geJyvZBCtAZoJ1wsI
         Tpu8IvmQL8iL3W7Ua51u+S9UMWaT2WVUgO4AVJZjJYXK/cRA2w2OrBPp2nV0x72B9dLU
         8qhokmE2rukuovOksMZviqwrGBY3M4vLK6WbbR2RfkS3jN7uMan5XoDDPFvhyNgYO7Xh
         dn7nHwJskXLrAnGRTKE4dmhyUv00IXZd1n5LYyU0Timyik3qWAF0A2fcqSarGbRm8wdh
         eS8hpC2HhxYiEcBpm1J9ezVmS38OSanA7BBCaq2NHmIISxYtmZEB/2PRwDgnTfj50nQS
         i7UQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YDa5prgK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=afErd2G59aKAf1Us+M5STerUyHDvBki7AWawvlRlxbY=;
        b=jNSq/4ykU/noeOOlJ8AzFY+9ldjG/MA8oN0SomTLeQhwTQOBlkyY2eyPXLHgABtlFP
         DEfsx/SePScR9Fp0/KE30NnTwKaMO5nbjz7Rz6DWdLgzPCQxMb4v+YZOvt2OIeHe6vWt
         Ct4hhKLVOTHbijHnWLopUNcCGOWBTE/iciUI79rbInkVunJLaYcKN1ZdGe3yuZEeq4aY
         kJe8SDt0BqSdCpYPM0tS8YikQdw07sz6s3zaPVfXwYQpQ56pbHLnHrfiaXsZsaalWsjj
         wuOIe8TyPfB1ScX5y6UpLhZmHYN5LSF7DF4YvT8ejMN0WgFAbDaNWSMG1/qxv9Gx44Ff
         hmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=afErd2G59aKAf1Us+M5STerUyHDvBki7AWawvlRlxbY=;
        b=pWHmA/9C4Z8cRglpj1kp9zyZt2hgWOA8RnhOfzaxCYmWEEeoNPYakGQnkeWb1CTSk/
         94253woeHV0TcUm8rsdbrlxWyT5Dprj/sBjwdGnn6XfmUAGsUklC05d3hl/L7pDH6LzR
         nrFltABDCt4tNSPjVLc6Xc6KU87ZCkUlcucUFIDL76xMvzEt37/SRu+PMwZNolDGFavg
         r06olTKIXw/4QAr1eBEiNqy8GROuIAZKIdXTUAKsGGcbQOQ746ALiq5cWUKelNUe/gMV
         shNbxs4XcXQojUmIP9bJ36TfKmrDF+AOaJbLvY+FAVnLAGfz3ihgp6u2fP4gyoZRL3Q9
         k8Og==
X-Gm-Message-State: ANhLgQ2pmaSP1nJvX9Jr4ZCkOR0n4fo0eq6lhab9XbhAaHrxiTQC71fi
	2CltSKWh7SA2aWvXYUXnuVY=
X-Google-Smtp-Source: ADFU+vvGklzmHeyu/wPKsmFKPiYcYaZ0m8TpdwnqNH2AW6JEPhZDGvAONDr7WBQNx4j+KSdQllu2Tw==
X-Received: by 2002:a17:90a:7309:: with SMTP id m9mr6433195pjk.52.1585322405121;
        Fri, 27 Mar 2020 08:20:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:af5b:: with SMTP id s27ls6275457pgo.11.gmail; Fri, 27
 Mar 2020 08:20:04 -0700 (PDT)
X-Received: by 2002:a63:f44d:: with SMTP id p13mr14996380pgk.113.1585322404374;
        Fri, 27 Mar 2020 08:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585322404; cv=none;
        d=google.com; s=arc-20160816;
        b=aRcaaJdQc6QE6U+895okfCC4I2UMZExdNgUzrMeA5axPLenfNj8eZurxAAOxL2ZHKL
         Ox3YTP7aeRugmtjZuHExpryKuq3XcMdCcF2xdWN39MZTod7W2war0igBd/9TQVxsxDGp
         2sld6a7fipGdub+JwwCpo/jxDF/c7HBw56piHIs6XnRhPpoJiKqiw/7k27pRr1ifoobu
         KiM6iSWAxydOV04WS2ewx9fQbp9O/Og4Wo272uS+ePH1i7HBsssosOOAvfNtZVfQ/m2u
         7LuM6BxkS2p6Uf8SrG8vZPStU7bPXLs6nR0xGOW4TfNaRrRacWqix31fF9EdcjBvTvLW
         TADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=zIIPu0Eu9GVQFv7l2j1CDQ35NB04UbUWdc0PlpE2Sgo=;
        b=WwMO3rZM407rRcxjipoGtCySiOvB5Lz5YQDfvgKmKEbbSmgH+JJ9J81xQYk/V39D4u
         q/D2CyK+UxDVSlmuwakU2BsERUTG6o7tZFlxc2+ggnFKx4kLQr/aGEcLitaJrRn1LDtY
         ayW9pu62a0tSUHx5nKs9u5U3dhdrfr8HuvQFqo8oRhz39EtNVtQWfhhqx+hC5C1bbGbG
         hrChdRTscQm8/anR+i80xWEBP992dnGsclfGJktZ6GeY+yDBWq+lmWQbsfEoz00C3wbx
         GTILW26QTGpXORWACLtqqpYVwGLEaNCDyzF54XJ/eijZ6TnYPVSmiyReRdSpVwwGiwSz
         BqQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YDa5prgK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id x12si399541plv.3.2020.03.27.08.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 08:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02RFK275052674;
	Fri, 27 Mar 2020 10:20:02 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02RFK2wJ096225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Mar 2020 10:20:02 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 27
 Mar 2020 10:20:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 27 Mar 2020 10:20:01 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02RFJxFu049608;
	Fri, 27 Mar 2020 10:19:59 -0500
Subject: Re: [RFC] Linux-less boot
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Marco Solieri <marco.solieri@unimore.it>,
        Luca Miccio
	<206497@studenti.unimore.it>,
        Alice Guo <alice.guo@nxp.com>
References: <CADiTV-1QiRhSWZnw+kHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw@mail.gmail.com>
 <AM0PR04MB4481DD780EC90AB57695B8E388CC0@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <964aced1-3e41-f9fc-30b7-57c7044acda2@ti.com>
Date: Fri, 27 Mar 2020 20:49:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481DD780EC90AB57695B8E388CC0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: multipart/alternative;
	boundary="------------91BC6ABBC698D0C9B33BEAA8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=YDa5prgK;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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

--------------91BC6ABBC698D0C9B33BEAA8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 27/03/20 6:43 pm, Peng Fan wrote:
> Hi Angelo,
>
>> Subject: [RFC] Linux-less boot
>>
>> Hi Jan, Peng, all,
>>
>> We currently have a better understanding of Peng's work [1] and manage t=
o
>> somewhat reproduce his results on another NXP board, the IMX8QM.
> Good.
>
>> Since you showed interest in this, we would like to start implement some=
thing
>> a bit more portable and user-friendly.
>>
>> In this regard, I would like to share some design choices:
>> - Jailhouse image stays more or less the same, all the code is added int=
o a
>> loader, expanding Peng's work to make it more portable (across Arm v8
>> boards for now) and generic. The loader will boot and init everything th=
at
>> jailhouse and the inmates need. Without the loader jailhouse can be star=
ted
>> exactly like it was before.
>> - The loader is platform-specific, and thus it's necessary, at compile-t=
ime, to
>> have a parameter that specifies the target (something like `BOOT=3D` or
>> `TARGET=3D`), using the root-cell information to fill the correct addres=
ses and
>> compile only the necessary drivers. Without the parameter, the loader is=
 not
>> compiled.
> I am not sure about x86. But for AARCH64 and RISC, let uboot pass
> a table to the loader, the table contains all platform specific things. T=
he format
> should be defined by jailhouse community.

I had tried to prototype the type1 jailhouse bootloader long time back. [1]
I used a python script [2]=C2=A0 to describe all the images needed for=20
loading the different cells.
It might be different files for Linux, baremetal inmates, etc

Based on the arguments, python script generates a data structure [3]=C2=A0=
=20
which loader can understand.
I also generated a linker script which packaged all the binaries in=20
single elf. But that can be ignored.


[1]=20
https://github.com/nikhildevshatwar/jailhouse/commit/6883c0a0b1e4cd12e8097c=
b656262f6d9b2fb4b1
[2]=20
https://github.com/nikhildevshatwar/jailhouse/blob/devel/type1-poc-upstream=
/tools/jailhouse-loader.py
[3]=20
https://github.com/nikhildevshatwar/jailhouse/blob/devel/type1-poc-upstream=
/loader.h

Regards,
Nikhil D

> Or use device tree, but that means needs to import libfdt to jailhouse.
>
>> - There is going to be a "sync" function at some point, probably when lo=
ading
>> the module, that can update the status of jailhouse so that the cells cr=
eated at
>> boot time are controllable. The idea is to have the same situation as if
>> jailhouse was started with the `enable`.
> Agree.
>
>> Finally, we would also like to hear from Peng, to understand his current=
 plan
>> so that we don't step in each other's toes.
> Ah. I was crazy busy in the past days on some remoteproc work, so stop th=
e
> Loader work for a while. but the other work will be done in a few days, a=
nd
> I will back to this:)
>
> Actually this feature is planned in our software release, and I need to h=
ave
> the loader related stuff checked in NXP tree in the end of April.
>
> My planned stuff are:
> arm32+arm64 inmate cell with arm64 jailhouse.
> Real cache color with Linux root cell + one inmate cell, and considering =
fit
> jailhouse into SRAM.
> As you listed, userspace tool support.
> Considering MMU for loader. But not sure this really needed currently.
>
> It is good we could reuse the work between, but not sure I could wait
> until then, because I have a tight schedule.
>
> Thanks,
> Peng.
>
>> [1]
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgrou=
ps
>> .google.com%2Fforum%2F%23!topic%2Fjailhouse-dev%2FIZEFz-e2lh4&amp;d
>> ata=3D02%7C01%7Cpeng.fan%40nxp.com%7C8ae0f1ab40054707b2af08d7d24
>> 3be6f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6372090607
>> 11306332&amp;sdata=3Dr8uxIgLOTqIMydWTlo6rDdaerSPd12MRnURPIUDA9X0
>> %3D&amp;reserved=3D0
>>
>> Angelo
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n
>> email to jailhouse-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgrou=
ps
>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCADiTV-1QiRhSWZnw%252
>> BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%2540mail.gmail.com&amp;dat
>> a=3D02%7C01%7Cpeng.fan%40nxp.com%7C8ae0f1ab40054707b2af08d7d243b
>> e6f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637209060711
>> 306332&amp;sdata=3DL4PCq2Lo6FlAqzw%2FhPr0p7dhtG3DrOsfRl%2BBtBV7lA
>> w%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/964aced1-3e41-f9fc-30b7-57c7044acda2%40ti.com.

--------------91BC6ABBC698D0C9B33BEAA8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    Hi,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 27/03/20 6:43 pm, Peng Fan wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:AM0PR04MB4481DD780EC90AB57695B8E388CC0@AM0PR04MB4481.eurprd04.p=
rod.outlook.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi Angelo,

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Subject: [RFC] Linux-less bo=
ot

Hi Jan, Peng, all,

We currently have a better understanding of Peng's work [1] and manage to
somewhat reproduce his results on another NXP board, the IMX8QM.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Good.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Since you showed interest in=
 this, we would like to start implement something
a bit more portable and user-friendly.

In this regard, I would like to share some design choices:
- Jailhouse image stays more or less the same, all the code is added into a
loader, expanding Peng's work to make it more portable (across Arm v8
boards for now) and generic. The loader will boot and init everything that
jailhouse and the inmates need. Without the loader jailhouse can be started
exactly like it was before.
- The loader is platform-specific, and thus it's necessary, at compile-time=
, to
have a parameter that specifies the target (something like `BOOT=3D` or
`TARGET=3D`), using the root-cell information to fill the correct addresses=
 and
compile only the necessary drivers. Without the parameter, the loader is no=
t
compiled.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I am not sure about x86. But for AARCH64 and RISC, let uboot pass
a table to the loader, the table contains all platform specific things. The=
 format
should be defined by jailhouse community.
</pre>
    </blockquote>
    <br>
    I had tried to prototype the type1 jailhouse bootloader long time
    back. [1]<br>
    I used a python script [2]=C2=A0 to describe all the images needed for
    loading the different cells.<br>
    It might be different files for Linux, baremetal inmates, etc<br>
    <br>
    Based on the arguments, python script generates a data structure
    [3]=C2=A0 which loader can understand.<br>
    I also generated a linker script which packaged all the binaries in
    single elf. But that can be ignored.<br>
    <br>
    <br>
    [1]
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nikhildevshat=
war/jailhouse/commit/6883c0a0b1e4cd12e8097cb656262f6d9b2fb4b1">https://gith=
ub.com/nikhildevshatwar/jailhouse/commit/6883c0a0b1e4cd12e8097cb656262f6d9b=
2fb4b1</a><br>
    [2]
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nikhildevshat=
war/jailhouse/blob/devel/type1-poc-upstream/tools/jailhouse-loader.py">http=
s://github.com/nikhildevshatwar/jailhouse/blob/devel/type1-poc-upstream/too=
ls/jailhouse-loader.py</a><br>
    [3]
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/nikhildevshat=
war/jailhouse/blob/devel/type1-poc-upstream/loader.h">https://github.com/ni=
khildevshatwar/jailhouse/blob/devel/type1-poc-upstream/loader.h</a><br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
cite=3D"mid:AM0PR04MB4481DD780EC90AB57695B8E388CC0@AM0PR04MB4481.eurprd04.p=
rod.outlook.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Or use device tree, but that means needs to import libfdt to jailhouse.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">- There is going to be a "sy=
nc" function at some point, probably when loading
the module, that can update the status of jailhouse so that the cells creat=
ed at
boot time are controllable. The idea is to have the same situation as if
jailhouse was started with the `enable`.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Agree.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Finally, we would also like to hear from Peng, to understand his current pl=
an
so that we don't step in each other's toes.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Ah. I was crazy busy in the past days on some remoteproc work, so stop the
Loader work for a while. but the other work will be done in a few days, and
I will back to this:)

Actually this feature is planned in our software release, and I need to hav=
e
the loader related stuff checked in NXP tree in the end of April.=20

My planned stuff are:
arm32+arm64 inmate cell with arm64 jailhouse.
Real cache color with Linux root cell + one inmate cell, and considering fi=
t
jailhouse into SRAM.
As you listed, userspace tool support.
Considering MMU for loader. But not sure this really needed currently.

It is good we could reuse the work between, but not sure I could wait
until then, because I have a tight schedule.

Thanks,
Peng.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
[1]
<a class=3D"moz-txt-link-freetext" href=3D"https://eur01.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fgroups">https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgroups</a>
.google.com%2Fforum%2F%23!topic%2Fjailhouse-dev%2FIZEFz-e2lh4&amp;amp;d
ata=3D02%7C01%7Cpeng.fan%40nxp.com%7C8ae0f1ab40054707b2af08d7d24
3be6f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6372090607
11306332&amp;amp;sdata=3Dr8uxIgLOTqIMydWTlo6rDdaerSPd12MRnURPIUDA9X0
%3D&amp;amp;reserved=3D0

Angelo

--
You received this message because you are subscribed to the Google Groups
"Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an
email to <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:jailhouse-dev=
+unsubscribe@googlegroups.com">jailhouse-dev+unsubscribe@googlegroups.com</=
a>.
To view this discussion on the web visit
<a class=3D"moz-txt-link-freetext" href=3D"https://eur01.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fgroups">https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgroups</a>
.google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCADiTV-1QiRhSWZnw%252
BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%2540mail.gmail.com&amp;amp;dat
a=3D02%7C01%7Cpeng.fan%40nxp.com%7C8ae0f1ab40054707b2af08d7d243b
e6f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637209060711
306332&amp;amp;sdata=3DL4PCq2Lo6FlAqzw%2FhPr0p7dhtG3DrOsfRl%2BBtBV7lA
w%3D&amp;amp;reserved=3D0.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
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
om/d/msgid/jailhouse-dev/964aced1-3e41-f9fc-30b7-57c7044acda2%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/964aced1-3e41-f9fc-30b7-57c7044acda2%40ti.com</a>.<br />

--------------91BC6ABBC698D0C9B33BEAA8--
