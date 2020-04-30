Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB3VGVP2QKGQE2OMROSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FC1BF98C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Apr 2020 15:32:32 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id d13sf6427709qke.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Apr 2020 06:32:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588253551; cv=pass;
        d=google.com; s=arc-20160816;
        b=u5VfpmV8LfYi2eMS2H/wbUugiHO8jsVt6L3wFpf151KLlb1VZ1m+upMymeIj5tlfdc
         iHmnEh9OyqJ16ASTTxbxGJ9e5BHU0/OYb7M+qzDk742pMSYLcT2akLAyGH/XPv5J4Jri
         kDY3GyqjyQXJe+Lgfk3i4q3Oe1rrOoFE2ukXM88ZqcXqNH7J1rxmiG03qio4Fa10zymt
         zTdrveV+gzm6GmGnsEHQ5s8MG14EzNGhqvWZMpV+Zggm63Kgo6inRhK1m//H0hpB+1t3
         rEOYIkd5CvsM4ebjRqBwrvV9GQNtZ7g4sYgzOEnx8KnZkVRCCjAjP1BXEoYtOM2C4mWM
         RbpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=hLx9OslB8/s/PhgZ8vB1DrwXOCzdYOPMWIkT9e2CutM=;
        b=MOaPuqpMpGIecQDSvgvCzPwedvC7V3hwJEcbMM++QscZU51TacY4zb2UQ/VcVirCq8
         /hFTk7QsI5Zz9HaEjgXZ7TEcjy4WReJwfv9ikPcZoFlY01RU7okLq+VG2yNtoAZcK2DU
         pa6z042LokqqOF46NKP1e8VYlcrOgmlKNLMg5/SfySl3ICpAUUbH4wGhlhL3zZGGTqxM
         EtOjAatkOeQxctvsYtQIzngxxby2poY3xNsP+mZPcIOqPID4g+gQ7tGrJKtUx0WIFWPd
         642I/y5uBRmk79+qKskYDb18zNxAHlkb8F+IpDekyvvdrlr7K1hDa8CQ2/z8TfrJ1Ljw
         aVng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QG6YvaY5;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=hLx9OslB8/s/PhgZ8vB1DrwXOCzdYOPMWIkT9e2CutM=;
        b=r/V887ISLd9dwMqZ2VQNjtM67nCJYnBGUOCK+z5mb/ByLiQYo2/jLBTL0ied1ld5Ge
         I44YWanFAL8j0+Rz5YdGyM5MERjBPcdNHMn+tUdvdTHluhVSSalWDhddX0IoXfq/WC78
         dlZJab0iNWyZP7SffedLYac4QVkDqdBGswwnc7L2NrNbcSjeWoBBomreSnkC5szgPIOs
         +HY2oDOFEm36AYHl325J/4R+V/QNHyJxXRwcECuadqVNtrQzsWw+hOz9YHzbFzR0b2mH
         t8cix9pQDcDL1v6lVc3geSkXHhwoupEHgv1QYWfna63+IntcLbrK4ZxObl0G+MlbDBrA
         Bi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hLx9OslB8/s/PhgZ8vB1DrwXOCzdYOPMWIkT9e2CutM=;
        b=PyW1T8DMDEamBhJ/XlMrUuiwAsvWUIFi93W8d6TtsP2UkHjI4skju471n+q4lUEPT9
         pgiLhihp+pRxKytG9B1b+CEawuWVjzbC7smpY0j58aG4sdiAo3cHr4N3LWDoS3IHONn8
         YH/Xtz+jefUDa8ZB6Q1FJHXP52Cqcz2AdYmTzYu5QeR5LNc2pgX1Q2zD3t7gvJ2t6Hzt
         QKg4+ni6a2FKaWvLSv4BajAfSVQRtL8oQW0b9sEOU4V2asABhz0nFii4SbOemVTd895G
         bS5lW4BM8bOZRC2Kv5Oo2//48sgKI22/SaqEdT2VyOt22yjAbxEJcX9VYR4Z6SgSlkv6
         czWA==
X-Gm-Message-State: AGi0PubwbEGBPdlTZHundsDmzUAPzQ9wfF20F0oaDqdYXJeiA0xbBIMO
	Zs1N6jDdxaqRwjYPcVDe87o=
X-Google-Smtp-Source: APiQypL7tqq/j9Rbaolr77YVdBNeHIidr1Vs5ZdwI0XYTyjE27bM+/1EUcDPWBWCjMZBV4zu+EsYCw==
X-Received: by 2002:a37:d247:: with SMTP id f68mr3324319qkj.362.1588253550929;
        Thu, 30 Apr 2020 06:32:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:468d:: with SMTP id g13ls1334039qto.11.gmail; Thu, 30
 Apr 2020 06:32:30 -0700 (PDT)
X-Received: by 2002:aed:2666:: with SMTP id z93mr3511878qtc.203.1588253550325;
        Thu, 30 Apr 2020 06:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588253550; cv=none;
        d=google.com; s=arc-20160816;
        b=fwvZfsfiRRZC8U2RUuvVoBUxi6YW7sigXbw+VS387xffYcO4M4+3HhJSZ7E9tlgECD
         MCvgi1Ynz1X6IhZWYUK8rVQXarUJXXueSAeY3tfKja63Q7IbrT08Y9NcAMyBaznwJBTJ
         K3NgI/b+6cwv9I4J/yW0RyfKaSg97Lbi/XqBnwwgktPvRRoF1Ajt+loDNuUEWeR2lGsR
         i5qoIZQldyHvWXXvw7C/MpZwhxuDsFBLgIusj2zLtPiSrJ8l8EusNEDZwE5HfhvK0zYX
         GRRbPCqwVFkLiODBttV9U3WWRa5iss3fMlaKvMgm7MP4V2MvffjuXY7kHjxnprdLrpao
         qIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=RF/BG0UWmnJD40E1Fi5yTMF46+Nt0Bb5rcl7WKWqzYs=;
        b=PcG3xm8KW5EtJrAxmTupPdhy4OFHfjQEbO3VKgMuwltQP/KBw/gdgInGfSIuDONCoC
         K3lAyaRqGNVlXLBYfnj+OP02J8vaTapwo5wpKxz5xRKoKdPZ6yAhQgAzpqBaw3mj+kd5
         nMDthMuYzVuR+r1JK9Mr5MU2tLS8DK28CowSYNMOCZREL+iVmdF6zGR8Gv6x++WM0cx5
         vEmtcd1Vja8T66gimcwlWbMwpkaAhJF/ZcuJ1wl+Rh6NXlI/90rYmViuCZKnYHwrGr6y
         hH3loymHQUHIZaJ9gLcDWdgnbNkj9iLVfrk9P+amuZS8Yte/XX1W1wpRQplFK+P4h5+R
         AIQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QG6YvaY5;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id g38si199628qtk.4.2020.04.30.06.32.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03UDWTh4041686;
	Thu, 30 Apr 2020 08:32:29 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03UDWTUe099728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Apr 2020 08:32:29 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 08:32:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 08:32:29 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UDWRqj111962;
	Thu, 30 Apr 2020 08:32:28 -0500
Subject: Re: ivhsmem_uio driver update
To: Jan Kiszka <jan.kiszka@siemens.com>, <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla,
 Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
 <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
 <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
 <92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <d0581908-3ee2-ad16-6ac1-c0741ab0c6b4@ti.com>
Date: Thu, 30 Apr 2020 19:02:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com>
Content-Type: multipart/alternative;
	boundary="------------C7BBB4C496F07B1A1458E3D4"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=QG6YvaY5;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

--------------C7BBB4C496F07B1A1458E3D4
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 30/04/20 7:01 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>
>
> On 09/03/20 4:52 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>
>>
>> On 09/03/20 4:39 pm, Jan Kiszka wrote:
>>> On 09.03.20 11:12, Nikhil Devshatwar wrote:
>>>> Hi Henning,
>>>>
>>>> As part of the TI SDK, we were integrating the ivhsmem_uio as 
>>>> external module
>>>> from https://github.com/henning-schild-work/ivshmem-guest-code
>>>>
>>>> Since the ivshmem changes in the Jailhouse, that driver no more 
>>>> works (because of the vendor ID change)
>>>> Do you plan to host the updated version of the driver in this repo?
>>>>
>>>> I know that the driver is already part of the siemens repo but it 
>>>> is much simpler to integrate an external module in yocto.
>>>
>>> Actually, that new driver is a complete rewrite, not just an ID 
>>> update. It allows to securely pass access to unprivileged users and 
>>> provides all features of the new ivshmem interface.
>
> With this driver, I can get the uio device registered but when I run 
> the uio_send and uio_read apps,
Using the uio_send and uio_read apps from 
https://github.com/henning-schild-work/ivshmem-guest-code/tree/master/uio/tests/Interrupts/VM

> I get mmap failure. Looking into more details, it seems that the new 
> driver exposes specific input and output regions to UIO
>
> Am I supposed to use a different app for testing the ivshmem?
>
> Regards,
> Nikhil D
>> Got it
>>> For that, it requires to patch the kernel with [1]. But given that 
>>> you have to patch your kernel anyway for other Jailhouse details and 
>>> given that this is trivial in yocto, I don't get the point of having 
>>> an external module package being easier.
>> Sure, I wasn't aware of this dependency.
>>
>> Regards,
>> Nikhil D
>>>
>>> Jan
>>>
>>> [1] 
>>> http://git.kiszka.org/?p=linux.git;a=commitdiff;h=651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=2c523b344dfa65a3738e7039832044aa133c75fb
>>>
>>
>> -- 
>> You received this message because you are subscribed to the Google 
>> Groups "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, 
>> send an email to jailhouse-dev+unsubscribe@googlegroups.com 
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>> To view this discussion on the web visit 
>> https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com 
>> <https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com?utm_medium=email&utm_source=footer>.
>
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/92c2a027-7a70-5d0b-d12a-45c54272afd8%40ti.com 
> <https://groups.google.com/d/msgid/jailhouse-dev/92c2a027-7a70-5d0b-d12a-45c54272afd8%40ti.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d0581908-3ee2-ad16-6ac1-c0741ab0c6b4%40ti.com.

--------------C7BBB4C496F07B1A1458E3D4
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
    <div class=3D"moz-cite-prefix">On 30/04/20 7:01 pm, 'Nikhil
      Devshatwar' via Jailhouse wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
      <br>
      <br>
      <div class=3D"moz-cite-prefix">On 09/03/20 4:52 pm, 'Nikhil
        Devshatwar' via Jailhouse wrote:<br>
      </div>
      <blockquote type=3D"cite"
        cite=3D"mid:5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com"> <br>
        <br>
        <div class=3D"moz-cite-prefix">On 09/03/20 4:39 pm, Jan Kiszka
          wrote:<br>
        </div>
        <blockquote type=3D"cite"
          cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">On
          09.03.20 11:12, Nikhil Devshatwar wrote: <br>
          <blockquote type=3D"cite">Hi Henning, <br>
            <br>
            As part of the TI SDK, we were integrating the ivhsmem_uio
            as external module <br>
            from <a class=3D"moz-txt-link-freetext"
              href=3D"https://github.com/henning-schild-work/ivshmem-guest-=
code"
              moz-do-not-send=3D"true">https://github.com/henning-schild-wo=
rk/ivshmem-guest-code</a>
            <br>
            <br>
            Since the ivshmem changes in the Jailhouse, that driver no
            more works (because of the vendor ID change) <br>
            Do you plan to host the updated version of the driver in
            this repo? <br>
            <br>
            I know that the driver is already part of the siemens repo
            but it is much simpler to integrate an external module in
            yocto. <br>
          </blockquote>
          <br>
          Actually, that new driver is a complete rewrite, not just an
          ID update. It allows to securely pass access to unprivileged
          users and provides all features of the new ivshmem interface.</bl=
ockquote>
      </blockquote>
      <br>
      With this driver, I can get the uio device registered but when I
      run the uio_send and uio_read apps,<br>
    </blockquote>
    Using the uio_send and uio_read apps from
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/henning-schil=
d-work/ivshmem-guest-code/tree/master/uio/tests/Interrupts/VM">https://gith=
ub.com/henning-schild-work/ivshmem-guest-code/tree/master/uio/tests/Interru=
pts/VM</a><br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com"> I get mmap
      failure. Looking into more details, it seems that the new driver
      exposes specific input and output regions to UIO<br>
      <br>
      Am I supposed to use a different app for testing the ivshmem?<br>
      <br>
      Regards,<br>
      Nikhil D<br>
      <blockquote type=3D"cite"
        cite=3D"mid:5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com"> Got it<br=
>
        <blockquote type=3D"cite"
          cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">For
          that, it requires to patch the kernel with [1]. But given that
          you have to patch your kernel anyway for other Jailhouse
          details and given that this is trivial in yocto, I don't get
          the point of having an external module package being easier. <br>
        </blockquote>
        Sure, I wasn't aware of this dependency.<br>
        <br>
        Regards,<br>
        Nikhil D<br>
        <blockquote type=3D"cite"
          cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com"> <b=
r>
          Jan <br>
          <br>
          [1] <a class=3D"moz-txt-link-freetext"
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
        You received this message because you are subscribed to the
        Google Groups "Jailhouse" group.<br>
        To unsubscribe from this group and stop receiving emails from
        it, send an email to <a
          href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com"
          moz-do-not-send=3D"true">jailhouse-dev+unsubscribe@googlegroups.c=
om</a>.<br>
        To view this discussion on the web visit <a
href=3D"https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-=
a2cf-2ba8efc80203%40ti.com?utm_medium=3Demail&amp;utm_source=3Dfooter"
          moz-do-not-send=3D"true">https://groups.google.com/d/msgid/jailho=
use-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com</a>.<br>
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
href=3D"https://groups.google.com/d/msgid/jailhouse-dev/92c2a027-7a70-5d0b-=
d12a-45c54272afd8%40ti.com?utm_medium=3Demail&amp;utm_source=3Dfooter"
        moz-do-not-send=3D"true">https://groups.google.com/d/msgid/jailhous=
e-dev/92c2a027-7a70-5d0b-d12a-45c54272afd8%40ti.com</a>.<br>
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
om/d/msgid/jailhouse-dev/d0581908-3ee2-ad16-6ac1-c0741ab0c6b4%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/d0581908-3ee2-ad16-6ac1-c0741ab0c6b4%40ti.com</a>.<br />

--------------C7BBB4C496F07B1A1458E3D4--
