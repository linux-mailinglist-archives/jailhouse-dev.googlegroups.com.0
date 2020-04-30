Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBLFGVP2QKGQEYDFKXVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id F19481BF985
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Apr 2020 15:31:27 +0200 (CEST)
Received: by mail-io1-xd3f.google.com with SMTP id z13sf1229906iog.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Apr 2020 06:31:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588253486; cv=pass;
        d=google.com; s=arc-20160816;
        b=rAE3glM3IzShXTHoUqVa1M0Gmnlf9zwe1JSD+5qDS48R4J097TnpnwNvZb6c8p2mkD
         TdArY+51Sfe+RTTxNsBRYEULMK1n/PiDqTKUhE/BA5bsFEGCaW7oI7AwZDEVlCoj3HLO
         zFMxcm0A3To0y++0HVvL864fpHKRGrEbp2RozgcmzMwkq52lyUqke+E0WMeQzGoBAUzZ
         D+G4ks/FmgHC9bSNV42nkKt3sKrQHL8xbFA/3hZ2L6c72QpCJbUyEzgzYy7mPU/1lFNQ
         K/P6DEwdN0sFNH+dMhAk3jzpCOm4nqUpxjMW9F/wkC+5ktl1HF5fhMxmNRFRVj+iaE17
         sAOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=aVJROxNjpqgzZ+HI5nEvgvKGRZ7AHGD/f45aqVjbit0=;
        b=tuB2S3g9BEcyq9neMJTnVYO/OqF4tyvkSmXW6CclIeYvmk5bg568fmefar+QSTKefR
         lWwx4b7ska3/0+zA07splioY86P4BVzVbZK0zLlv8qpr58Rpj8Iq9G7v5v1d7rdD2aA3
         Vx1prCEqWEiSjIDSizKN9u7dmgB55X2i16ste223XxpZ+NjVKaQmfp6o2LKGj3U4qOPv
         47Wtu71+Z6xVCekOrKVEWjtmFkbfGJn83a/BOVUzQC/vFPfkiBb9A5/Um1I9dh5baHk3
         5A/wdj0N3nvAYC0eYBd6Fn+7AZfDp+AMew4BuJiQSVflCAdLkuUyqYtEH+8bv8NwM9j6
         OMEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BzSFiAcS;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=aVJROxNjpqgzZ+HI5nEvgvKGRZ7AHGD/f45aqVjbit0=;
        b=pLfwI/DTVC1IH8SucEiggr9WURlK7LHposCD8bPvUqNmO2yzgiWuXyNVp558XKr0+3
         /k59oWg79bZSWO7+kcDZ15ma9UKNUHjR4kn+YVvWMu+Ua0XkRvm2W9kRiCOKovdKZyON
         hzEWkFsGfdtBty7f+cgrYq/nCEe6KufbJqq4LYj3IvEYGA67/qq0aQ84rBhDOaSapEBF
         o1bgDKbNkm0gaI5WuV98uOolYCZH/Aj4wvggWLMXt5GQqUBGjzXKYSSk1qu+pJ54teFx
         5inIWzRyNnj+RrK5w4wbXpRRfbHtpol5R6zXbS+R7eSlYu3FYAqIT/Lt8ZHZ/pToj+6c
         EKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aVJROxNjpqgzZ+HI5nEvgvKGRZ7AHGD/f45aqVjbit0=;
        b=KRXqhiYSHY+cf0PaRW9cEMirKvDhYBlotC9Brm76DMrwhwtSIRWN/8ritxT1CjQf2j
         nzZOQ9c6YA0ViBPTs4Mm1kvEI4ZElHoJp8yCcPS1apOnXWpfAthxsHhaTSbiShzgZKK/
         hIm7tx6jQdAGQJlhtkiusQnJgxQpC6vYA1scVx4hlCR9ZXfO0T9TczNdw0O0Ywbq4Xdn
         uJc/R41kv0cZRukHImtX6fsulGtcPTeOd2kynNLJYXiWmieUaeyDm4sqz1lpN9vQuY22
         jab1c55YrC51DDhVgnHXVAw8tfW+8ZE1cRBhBQ2zUqQG/6swam0UmGxXc9XtWIk39BbJ
         xJCQ==
X-Gm-Message-State: AGi0PubYF25Q9FG2l5pK1D7bvi3QqaM9+fHvMIopPDcvw9yOiDG7fCie
	hlVYuxiEtIef3mOcYzyT1AA=
X-Google-Smtp-Source: APiQypJze/cS8/eS+ZfB3Hol8rZ43bTlyZXIi1RqcdCrwk6f4VYzECGdcaS2CuGTZiSTH5+VpQyXJQ==
X-Received: by 2002:a02:b055:: with SMTP id q21mr1865572jah.7.1588253485260;
        Thu, 30 Apr 2020 06:31:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:d481:: with SMTP id p1ls1074168ilg.2.gmail; Thu, 30 Apr
 2020 06:31:24 -0700 (PDT)
X-Received: by 2002:a92:89d5:: with SMTP id w82mr1873120ilk.153.1588253484594;
        Thu, 30 Apr 2020 06:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588253484; cv=none;
        d=google.com; s=arc-20160816;
        b=qmeBcJDfBQ6vGGImc0GA9+MbIo9400zarfBJvs//wRPSP2q8ao2XR4+9onukUcQGS7
         QudDD5KaUZuzMVVAZdprm5Zyxa+nwo0S2IBe0sfAQsTrz0rYqwOF1RE0M2TGZcmoLOsR
         88wBsE6ETEPJ2VGpf5sB0qk/3ZQQz1/sIORElMWaaJzS8PCgMzlmHqbHwA87aoRZW2a4
         NCvyjQCTyD+V5NIT2ugo54jK/YLHKLumcfA93SHp2QJ1kZPVrtRPynWOYWrjHBw1pAc8
         No87Dq8r8ah99T2DaqWKoO5nWEplAhFuEBnib7Mg/KJG0tF8iQYipXCfkZ+hHRukUf3B
         hTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=AQUYX3+Whk94cHu8B0czQPhRqf0OAkCZfspoScWk/SY=;
        b=uWWaQM2srBrwqJDSECFT7hpYRbsS0RisT076YDFMu+C6PE38p/UVn+A+UHJQEEujjB
         ZFpW26MoCsEJNt+J/QSBnDyoYxQBde7n/a0kaWEIEHZS0VsGKubnOVXsjyANwkhFxKFg
         xaMfN4ixN/y76RPa32qqXMzZmHzLp6Mc+YAGD+bWwgaok6Qi23pW3Kyp2glFtFqshzQl
         AXScbvTPcKP0spObb6NHVcWhdlr78lr8nV2piRKG76od4qv5Psu6Whyb67vqi3JchdZO
         9Rhhlr3chUganseDJcrx/DxMMo97hf4oZEzEchS1Dh/D2qxVP7Y44NDcLMVIkBr/Vvrl
         BoUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BzSFiAcS;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id p5si438422ilm.1.2020.04.30.06.31.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03UDVONM112972;
	Thu, 30 Apr 2020 08:31:24 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UDVOLT108260;
	Thu, 30 Apr 2020 08:31:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 08:31:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 08:31:23 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UDVLtC081791;
	Thu, 30 Apr 2020 08:31:22 -0500
Subject: Re: ivhsmem_uio driver update
To: Jan Kiszka <jan.kiszka@siemens.com>, <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla,
 Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
 <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
 <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com>
Date: Thu, 30 Apr 2020 19:01:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
Content-Type: multipart/alternative;
	boundary="------------BF888C4233FA74F231C86E99"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=BzSFiAcS;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

--------------BF888C4233FA74F231C86E99
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 09/03/20 4:52 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>
>
> On 09/03/20 4:39 pm, Jan Kiszka wrote:
>> On 09.03.20 11:12, Nikhil Devshatwar wrote:
>>> Hi Henning,
>>>
>>> As part of the TI SDK, we were integrating the ivhsmem_uio as 
>>> external module
>>> from https://github.com/henning-schild-work/ivshmem-guest-code
>>>
>>> Since the ivshmem changes in the Jailhouse, that driver no more 
>>> works (because of the vendor ID change)
>>> Do you plan to host the updated version of the driver in this repo?
>>>
>>> I know that the driver is already part of the siemens repo but it is 
>>> much simpler to integrate an external module in yocto.
>>
>> Actually, that new driver is a complete rewrite, not just an ID 
>> update. It allows to securely pass access to unprivileged users and 
>> provides all features of the new ivshmem interface.

With this driver, I can get the uio device registered but when I run the 
uio_send and uio_read apps,
I get mmap failure. Looking into more details, it seems that the new 
driver exposes specific input and output regions to UIO

Am I supposed to use a different app for testing the ivshmem?

Regards,
Nikhil D
> Got it
>> For that, it requires to patch the kernel with [1]. But given that 
>> you have to patch your kernel anyway for other Jailhouse details and 
>> given that this is trivial in yocto, I don't get the point of having 
>> an external module package being easier.
> Sure, I wasn't aware of this dependency.
>
> Regards,
> Nikhil D
>>
>> Jan
>>
>> [1] 
>> http://git.kiszka.org/?p=linux.git;a=commitdiff;h=651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=2c523b344dfa65a3738e7039832044aa133c75fb
>>
>
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com 
> <https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/92c2a027-7a70-5d0b-d12a-45c54272afd8%40ti.com.

--------------BF888C4233FA74F231C86E99
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
    <div class=3D"moz-cite-prefix">On 09/03/20 4:52 pm, 'Nikhil
      Devshatwar' via Jailhouse wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
      <br>
      <br>
      <div class=3D"moz-cite-prefix">On 09/03/20 4:39 pm, Jan Kiszka
        wrote:<br>
      </div>
      <blockquote type=3D"cite"
        cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">On
        09.03.20 11:12, Nikhil Devshatwar wrote: <br>
        <blockquote type=3D"cite">Hi Henning, <br>
          <br>
          As part of the TI SDK, we were integrating the ivhsmem_uio as
          external module <br>
          from <a class=3D"moz-txt-link-freetext"
            href=3D"https://github.com/henning-schild-work/ivshmem-guest-co=
de"
            moz-do-not-send=3D"true">https://github.com/henning-schild-work=
/ivshmem-guest-code</a>
          <br>
          <br>
          Since the ivshmem changes in the Jailhouse, that driver no
          more works (because of the vendor ID change) <br>
          Do you plan to host the updated version of the driver in this
          repo? <br>
          <br>
          I know that the driver is already part of the siemens repo but
          it is much simpler to integrate an external module in yocto. <br>
        </blockquote>
        <br>
        Actually, that new driver is a complete rewrite, not just an ID
        update. It allows to securely pass access to unprivileged users
        and provides all features of the new ivshmem interface.</blockquote=
>
    </blockquote>
    <br>
    With this driver, I can get the uio device registered but when I run
    the uio_send and uio_read apps,<br>
    I get mmap failure. Looking into more details, it seems that the new
    driver exposes specific input and output regions to UIO<br>
    <br>
    Am I supposed to use a different app for testing the ivshmem?<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com"> Got it<br>
      <blockquote type=3D"cite"
        cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">For
        that, it requires to patch the kernel with [1]. But given that
        you have to patch your kernel anyway for other Jailhouse details
        and given that this is trivial in yocto, I don't get the point
        of having an external module package being easier. <br>
      </blockquote>
      Sure, I wasn't aware of this dependency.<br>
      <br>
      Regards,<br>
      Nikhil D<br>
      <blockquote type=3D"cite"
        cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com"> <br>
        Jan <br>
        <br>
        [1]
        <a class=3D"moz-txt-link-freetext"
href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dcommitdiff;h=3D651db1cf858=
dd7afef7ef98c7db86223c1f73a59;hp=3D2c523b344dfa65a3738e7039832044aa133c75fb=
"
          moz-do-not-send=3D"true">http://git.kiszka.org/?p=3Dlinux.git;a=
=3Dcommitdiff;h=3D651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=3D2c523b344df=
a65a3738e7039832044aa133c75fb</a><br>
        <br>
      </blockquote>
      <br>
      -- <br>
      You received this message because you are subscribed to the Google
      Groups "Jailhouse" group.<br>
      To unsubscribe from this group and stop receiving emails from it,
      send an email to <a
        href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com"
        moz-do-not-send=3D"true">jailhouse-dev+unsubscribe@googlegroups.com=
</a>.<br>
      To view this discussion on the web visit <a
href=3D"https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-=
a2cf-2ba8efc80203%40ti.com?utm_medium=3Demail&amp;utm_source=3Dfooter"
        moz-do-not-send=3D"true">https://groups.google.com/d/msgid/jailhous=
e-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com</a>.<br>
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
om/d/msgid/jailhouse-dev/92c2a027-7a70-5d0b-d12a-45c54272afd8%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/92c2a027-7a70-5d0b-d12a-45c54272afd8%40ti.com</a>.<br />

--------------BF888C4233FA74F231C86E99--
