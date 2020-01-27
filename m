Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB44YXTYQKGQE77M72PY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5714A7E2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 17:14:44 +0100 (CET)
Received: by mail-ot1-x33a.google.com with SMTP id b10sf6404212otp.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 08:14:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580141683; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zv7isWtqiv30onNvPWpWx3u9MP5TRetqdyv0lyX7H2domCKL6zDfuylO9GpyoKd2oK
         uaQctEub3sa+fHDOtE4aeqelgLjRY+YwTdS8YOqzt57drFa2Kpr+Offx52AlZvBF0w6U
         NnlieNJkgEHoCnfeOYlyusEhbU7iM7Ds51Gtbo6jmGvjuh8Drmb93/MciFWWwzA5Zb7A
         E96opj+zcU3iHMy/sBKFy9OKb+a4m6l0lWljugt5szRBZjc2AR1fn8rQu6W69NWjkHxn
         4EUvWEWEaS2/KXDrQgMe2BEeNO407ENilOEAQOo4Pfu8XwQ6LhsOvHo9fKKu3zpjU+Qo
         xPEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=vKukNdRpajsNfQ31qqwJnuCGfyShgRiZuzoJnrDnr+4=;
        b=tGuAZ0Qgwi81c791gqgmucMYfmt8UvIyuhe3L66a+hyMBj1/E4Hm4/qdgcz0UYQSUZ
         tHvggvdaoyXLCX4kIfV95wS5zj2gftDvdOmzCOSN2XnU5BjwyJmaGcdp/ewWuD5lRuX1
         /yhnEc1GJ+vcqfwBzmCYi2s69glcMsMHTH+WS2srE0BrbA8zj9616W0S5T+L6HEbUbyO
         4Mky00gk8/ch9plzfcKI7wWiBLRclV7+UWByxbrnv0ZNKNBGprGQyRe+9WYDamx2P0U3
         eRx/1WtOy88xu3ava7FzbONPrksTilRVEZYZeSleE3fdKgOYaUajTuSyCKfJ/u5Hpoa2
         uX+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DNcYTv1D;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=vKukNdRpajsNfQ31qqwJnuCGfyShgRiZuzoJnrDnr+4=;
        b=UF+Daom0xN3gFHTBM5neKs1WNA4lUR0ukc8HRh3JG7nxRidlIEpLFKqOJCvrUV/xF0
         lxo26N85zSiK1SlyEEI6z2WHb+C7KFX4BUu1J+VgIiN8olyZ5PFgam7sWqHoCGDi0eHP
         NjG/CY7YSjWe1/5dlSv9drpp23ysbsrl8kKJ3pByJsUYsKOS9kS2MLs8fhFbQQGBwjop
         jDHAMBd1G6WldmBk3wRc8DhUptKRA4JktsHzK2Lsh6SrXYFjl8wVFl2lJnyMlYkDXb2C
         jIAwROHEbabQEFT/jdkFAAjMuDd0JrmLBCLYURe5HZXHUBMgLHlS9Sc5xlqXHpLAIVai
         4R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vKukNdRpajsNfQ31qqwJnuCGfyShgRiZuzoJnrDnr+4=;
        b=jQppGetfAZGcInGGEH8qlIb6Dkz/E4SOJOTfqjr52gspOt1CiaxHDkbexrlHV5KaJq
         haNDOkKcQIpu7D6Wv0CI3kK/4z4OlODWHD6eCpxm+OamyI3vCSa1HMaaCbAA/x3wd0kt
         QxI/qrB1/toabKq6zPrGyU0hwk80c++XHTnuzzSdqCVQz2jnvCcMF7Ix1kX3r5SndCLM
         plHxkJ/R+ghjyxt9Q9fmVPqI4huKJOTGYq01l3xXdZfUGcTXat6F8QG0SKgqnFVvMg9y
         lPRS05OAGutselzbYwyLS+FMc6oOX/8nQFfWmgC3JALaAnjWUsdmBw00nn8fSShjbSF9
         QcVA==
X-Gm-Message-State: APjAAAXyBGNQZsSH/gJ7IyqOqfv2/N6kmjQqHipAUaghN6yI/YODTV5Z
	bMkguaucmXcJdKE9GMSqNPk=
X-Google-Smtp-Source: APXvYqyGa78ocWJUj45KYk0cd26osUahWvhEs7mhFxoHuAvxqeLCI4Mq/wOGUcfeFEIXxseTqzO6mw==
X-Received: by 2002:aca:ed08:: with SMTP id l8mr3487830oih.80.1580141683707;
        Mon, 27 Jan 2020 08:14:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cf95:: with SMTP id f143ls1440648oig.7.gmail; Mon, 27
 Jan 2020 08:14:43 -0800 (PST)
X-Received: by 2002:aca:5746:: with SMTP id l67mr5553888oib.60.1580141683105;
        Mon, 27 Jan 2020 08:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580141683; cv=none;
        d=google.com; s=arc-20160816;
        b=WFBNLHbLp6XFo6OHjmx8Snaz8M6cI8Ix9Clc+sytNDLx8p3C2zf/vNr1jNibYjYhVZ
         3Qn5dsUb3JxsvZ5qhsHs7I46AXdoiZfl4+XIMfGwqBjLXlWu16Qx+5GxVmv4ctJnrC23
         +r76sNztv3DOVEhf6ulvcnE6CEYiGAUCxQj4wsb6SfkPSaaAf4NC4kpEaSZw6rycZ//e
         dEi5kioZRWN5zhz46PuScRGEeETHh+SiE/spzDdGGUdIgJWTzjFVVqzZtODw3MUhgjpc
         SfwGKaXv9MByFn+3h1jQjJJxTWrs/ogN4iWkIwIoLUw6XPw+cuhS2eqwuOTyAU+dMLOK
         i3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lMadSVDyExMTIVyMwozLzm1XGHbX+uTomyahxAsZ5yc=;
        b=pwamz6iB/LjUOSCoK9VMj065XtJe7bDv0RhHjrfRSPDzw9j+3hMRT/Qob3X5uCztBD
         26VZDfJVu63UwT9036jmu+eKkLU5QgRiK9/zzNS/eaUTPRVlRUCa1VkcESYzoesj7u0W
         aGdnE+pf6Uzq0qVKuKcvXPchCpcOir43yqS3XhpigkjfhtR9V55YI7fNEdn/Cu7EO4Lt
         cDW2KQf+sbkHGdRnQF/n4M2EBMiVgZEq8uIHCro74bZW48PTzi6umXBhFwzg6X8UsW98
         4DmCqycUe44N/efKft+NCOH8NZKuBwf4WLg0ClIPwi//6DYPPI7N8XSj1gPvI+67o+w1
         bxGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DNcYTv1D;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id 14si685040oty.3.2020.01.27.08.14.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 08:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RGEgM5068423;
	Mon, 27 Jan 2020 10:14:42 -0600
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RGEf11099609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 10:14:42 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 10:14:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 10:14:41 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RGEdMr092179;
	Mon, 27 Jan 2020 10:14:40 -0600
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jan Kiszka
	<jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
Date: Mon, 27 Jan 2020 21:43:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
Content-Type: multipart/alternative;
	boundary="------------DA398CDA0E3726533BF93F58"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=DNcYTv1D;       spf=pass
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

--------------DA398CDA0E3726533BF93F58
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>
> On 27/01/2020 15:49, Jan Kiszka wrote:
>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> This series adds support for partitioning registers across different
>>> cells
>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>> where it uses
>>> MMU mapping for page aligned regions and subpage handler for non
>>> aligned regions.
>>>
>>> However, most of the embedded platforms will have common set of
>>> registers which
>>> need to be partitioned at the granularity of single register. One such
>>> example is
>>> the pinmux registers avaialble in many platforms including K3 J721e.
>>>
>>> This series implements a regmap unit which allows to describe the
>>> ownerhip of the
>>> registers using a simple bitmap. This scales well when you have to
>>> partition
>>> hundreds of control module or pinmux registers.
>>>
>>> Nikhil Devshatwar (4):
>>>  =C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_regions
>>>  =C2=A0=C2=A0 core: Introduce regmaps in cell config for partitioning r=
egisters
>>>  =C2=A0=C2=A0 core: Implement regmap unit for partitioning registers
>>>  =C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG registers
>>>
>>>  =C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 +++-
>>>  =C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>  =C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +-
>>>  =C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
>>>  =C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=C2=A0 47 ++=
+++
>>>  =C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 258 ++++++++++++++++++++++++
>>>  =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>  =C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>  =C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>  =C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>  =C2=A0 create mode 100644 hypervisor/include/jailhouse/regmap.h
>>>  =C2=A0 create mode 100644 hypervisor/regmap.c
>>>
>> Worthwhile to discuss, indeed. The key question for me is how well it
>> could map on other SoCs. Ralf, do you think it could be that simple,
>> based on your experiments? Or could we also face scenarios where we
> The question is what you try to achieve:
>
> Jan, when you introduced subpaging, the goal was to allow to assign
> devices to different domains, if multiple devices are located on the
> same page. We can observe that pattern on many platforms, and subpaging
> provides a "generic" solution.
>
> So what do you try to achieve with subpaging on a byte-wise/bit-wise
> granularity? Make a non-partitionable device partitionable? That will
> only work for some rare cases.
The main intention here was not to partition peripheral devices, but=20
just the registers
which are not really related to any device.

Most SoCs will have something like this where pinmux registers,
efuse registers, internal muxes, MAC addresses, and other config options=20
are provided.

This series was intended to solve these kind of register partitioning.

> However, those cases exist, and I think it can really be helpful.
>
>> would have to dispatch bits of a registers? We already do in some GIC
> Yes, unfortunately I can imagine such scenarios, and even bitwise
> dispatching is not enough. Two examples:
>
> 1) Reset controllers. E.g., the Jetson TK1/TX1 have bitwise granularity
>     (cf. reset.png). Here we need bitwise granularity. But that's still
>     easy.
>
> 2) Clock controllers. The semantic of a bit in a register may depend on
>     the configuration of a higher-level clock. On the other hand,
>     the reconfiguration of a higher might affect lower-level clocks
clocking, power management, reset should be handled via a common
software entity, It is designed considering virtualization in mind.
Typical clocks are trees, where you need to change multiple parent=20
clocks and muxes.

I believe this problem cannot be and should not be solved by Hypervisors.

On TI k3 devices, DMSC (Device mangement and security controlled) does=20
this job
and Linux drivers use firmware APIs to get this done.

Regards,
Nikhil D
>     across multiple cells.
>
> Let me just share the thoughts we had back then...
>
> So for 1), bitwise granularity would really be helpful. But keep in mind
> that upstream drivers usually don't like that. What would you do, if
> your inmate violates the permissions? Probably panic the cell. But by
> default and in case of Linux, many drivers aren't aware that they only
> see a subset of the device's functionality.
>
> ~Two years ago, I evaluated a similar approach. I ended up in rewriting
> kernel drivers (with no benefit for upstream)...
>
> And I see no easy way to solve 2) despite a constant, static (freeze)
> configuration. That comes with a lot of drawbacks, as inmates aren't
> able to dynamically reconfigure the device. In case of a clock device,
> they aren't able to, e.g., change the speed of I2C, SPI, you name it.
>
> We thought of paravirtualisation. In case of Jailhouse this is surely no
> solution: It requires to provide an abstract device model together with
> an implementation for thousands of different devices - no chance.
>
> The third approach would be to implement the device's functionality in
> the firmware in a partitionable manner, and use jailhouse only to
> moderate access. Only feasible from the Jailhouse PoV.
>
> HTH,
>    Ralf
>
>> regs, clock gates may be another case.
>>
>> Jan
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c02f19d0-183e-a12c-5364-ccb391a2cab8%40ti.com.

--------------DA398CDA0E3726533BF93F58
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
    <div class=3D"moz-cite-prefix">On 27/01/20 9:30 pm, Ralf Ramsauer
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">

On 27/01/2020 15:49, Jan Kiszka wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 27.01.20 14:56, nikhil.nd=
 via Jailhouse wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhi=
l.nd@ti.com&gt;</a>

This series adds support for partitioning registers across different
cells
in the Jailhouse. Jailhouse supports partitioning memory regions;
where it uses
MMU mapping for page aligned regions and subpage handler for non
aligned regions.

However, most of the embedded platforms will have common set of
registers which
need to be partitioned at the granularity of single register. One such
example is
the pinmux registers avaialble in many platforms including K3 J721e.

This series implements a regmap unit which allows to describe the
ownerhip of the
registers using a simple bitmap. This scales well when you have to
partition
hundreds of control module or pinmux registers.

Nikhil Devshatwar (4):
=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_regions
=C2=A0=C2=A0 core: Introduce regmaps in cell config for partitioning regist=
ers
=C2=A0=C2=A0 core: Implement regmap unit for partitioning registers
=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG registers

=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 +++-
=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +
=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=C2=A0 47 +++++
=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
258 ++++++++++++++++++++++++
=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 22 +-
=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
=C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
=C2=A0 create mode 100644 hypervisor/include/jailhouse/regmap.h
=C2=A0 create mode 100644 hypervisor/regmap.c

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Worthwhile to discuss, indeed. The key question for me is how well it
could map on other SoCs. Ralf, do you think it could be that simple,
based on your experiments? Or could we also face scenarios where we
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
The question is what you try to achieve:

Jan, when you introduced subpaging, the goal was to allow to assign
devices to different domains, if multiple devices are located on the
same page. We can observe that pattern on many platforms, and subpaging
provides a "generic" solution.

So what do you try to achieve with subpaging on a byte-wise/bit-wise
granularity? Make a non-partitionable device partitionable? That will
only work for some rare cases.</pre>
    </blockquote>
    The main intention here was not to partition peripheral devices, but
    just the registers<br>
    which are not really related to any device.<br>
    <br>
    Most SoCs will have something like this where pinmux registers,<br>
    efuse registers, internal muxes, MAC addresses, and other config
    options are provided.<br>
    <br>
    This series was intended to solve these kind of register
    partitioning.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">
However, those cases exist, and I think it can really be helpful.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">would have to dispatch bits =
of a registers? We already do in some GIC
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Yes, unfortunately I can imagine such scenarios, and even bitwise
dispatching is not enough. Two examples:

1) Reset controllers. E.g., the Jetson TK1/TX1 have bitwise granularity
   (cf. reset.png). Here we need bitwise granularity. But that's still
   easy.

2) Clock controllers. The semantic of a bit in a register may depend on
   the configuration of a higher-level clock. On the other hand,
   the reconfiguration of a higher might affect lower-level clocks
</pre>
    </blockquote>
    clocking, power management, reset should be handled via a common<br>
    software entity, It is designed considering virtualization in mind.<br>
    Typical clocks are trees, where you need to change multiple parent
    clocks and muxes.<br>
    <br>
    I believe this problem cannot be and should not be solved by
    Hypervisors.<br>
    <br>
    On TI k3 devices, DMSC (Device mangement and security controlled)
    does this job<br>
    and Linux drivers use firmware APIs to get this done.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de">
    </blockquote>
    <blockquote type=3D"cite"
      cite=3D"mid:d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de">
      <pre class=3D"moz-quote-pre" wrap=3D"">   across multiple cells.

Let me just share the thoughts we had back then...

So for 1), bitwise granularity would really be helpful. But keep in mind
that upstream drivers usually don't like that. What would you do, if
your inmate violates the permissions? Probably panic the cell. But by
default and in case of Linux, many drivers aren't aware that they only
see a subset of the device's functionality.

~Two years ago, I evaluated a similar approach. I ended up in rewriting
kernel drivers (with no benefit for upstream)...

And I see no easy way to solve 2) despite a constant, static (freeze)
configuration. That comes with a lot of drawbacks, as inmates aren't
able to dynamically reconfigure the device. In case of a clock device,
they aren't able to, e.g., change the speed of I2C, SPI, you name it.

We thought of paravirtualisation. In case of Jailhouse this is surely no
solution: It requires to provide an abstract device model together with
an implementation for thousands of different devices - no chance.

The third approach would be to implement the device's functionality in
the firmware in a partitionable manner, and use jailhouse only to
moderate access. Only feasible from the Jailhouse PoV.

HTH,
  Ralf

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">regs, clock gates may be ano=
ther case.

Jan

</pre>
      </blockquote>
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
om/d/msgid/jailhouse-dev/c02f19d0-183e-a12c-5364-ccb391a2cab8%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/c02f19d0-183e-a12c-5364-ccb391a2cab8%40ti.com</a>.<br />

--------------DA398CDA0E3726533BF93F58--
