Return-Path: <jailhouse-dev+bncBAABBLELSL2AKGQEHSRDLDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86419AB6E
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 14:14:38 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id v198sf20376775oia.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 05:14:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585743277; cv=pass;
        d=google.com; s=arc-20160816;
        b=S5Wyndso/7xHrgKEQOBdxfwlhD18HG1OWu66N4/4TtD3Z0rgoZz1vPjBe0zTx+MyJP
         ozIf9ybnpobS5u2A/F5QPGS/ZJQuHIs4iKZipNnNkY0S7I/Xis/FFGtDre7lJy1UKjES
         5tRsYSTo70C0wvQFDWKUnnrWE1wXUwEW3PNJzTwEBwv7yjS1lJQ090Tn+t/5pRbeQtVw
         Xn9OAELYg1A3l5/YZ75eg8L0lPmf4hy1yryZach13PI8JMfpAN9mYqdt/tUa3qPBKMNe
         auzjCwY3jRu/Cow8VSLhIMLn+X/zeK5hsM6V63oQCbcArsr1dkBatXf4+R7EF3qJBixk
         GJcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:ironport-sdr:sender:dkim-signature;
        bh=jvpNH9jRsgAZie4VnJTu7zumyKeVoElNSKaMzJZ02AA=;
        b=D12gEdthEk83ZFBboFif70XLSpt/tNmsbsvGeWr1BN0AEOvrfwOcSHJO0jENaYVzhV
         gYW+p89l0C/uqVhMb4iAuRYLcaSJ2vd2ewhHJEcYf5UyShNTHptzqAWLxrzyeVkCA0yo
         owQU2br/MoMWc3dsEFl1Pb84Zo5elVoJzlaAp/OAWd8U/I2rdkPnQ16fEb3DoNYyUrJe
         4rAVwQin28JTPW9LK5vfYrnGXU2gGh337JTcv3HIUeMDiPOd/VFJqu23uFTiCSWT9uVL
         Csgh/2F9BKzLmMRucYKBE0nXI4HaddyTUCZXwf0+ML/JruPKo7atmWuP5/2G2mlT4sQr
         5LPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b="id/UBEk7";
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.153 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jvpNH9jRsgAZie4VnJTu7zumyKeVoElNSKaMzJZ02AA=;
        b=LCYA1JKdNUV8qQtGeEfdN6jQXUUtpvhgmCSMbObDp1X9sQhsMeq+/YM/x+al1WLuJT
         PEvlfwrd4E7HCAc5nPnFIMKde/Y6HtPvX3fu4IJVJVac910KH3oC2WcE7HqcHkeXv5iI
         zflGwWFgx8Ac/6vX2hPLlKLs4w226ZR/8wgFmUwhVrt/V29/+gPOnNqyTCmK2iCMXAmL
         ehbtIHA9C2ljmaWW+Q7ECFHNSfgap4R1BKAKo6cNiEvD2c96vwmqrfQE5cGiBIjYKYmM
         PQK60+OaCdgl83rQohOJaAnhNVILNwaUWeYJkb9SPbriOLCo0RJzsH1E1ovYVhOP6wXO
         ylyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:subject:to:cc:references
         :from:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jvpNH9jRsgAZie4VnJTu7zumyKeVoElNSKaMzJZ02AA=;
        b=Bda7I1j0A7C/dKkkXMuNasGKYm1saVv0fVZ3jdfXJF53TyH/ztFAyM7T37+Ir1zZPf
         q83NUnsfZj2J6qPgguDxUx34g+OehrKbQ6WDss9gzqWqUWQabnXC1IknGYboT0NYB2Ue
         QyZftNCswqVZ0CimwnCnsBh8JlUbDP27Nj+bx32THVh5IGtwi4moZbyu9W0W7fQzODY2
         qdL3lEn/HyixZHA+A3OGQ1++tavTsYfW2RaVDU8XIlKQNWxnf+YVzQEtNPy1DMMLUR5X
         KI9EacnJyfahLebz7f1YAf65oxwMkiLQpcojioIcGI9jDH5OfctZt9m6zHM64kq1dweE
         qkyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaMepUh9a8cRDytpqLsAno67s/O/rYFZZ0Q6XtSFzXhF6tID+SB
	nM+rosvPHNrQM1O4m1rxIs0=
X-Google-Smtp-Source: APiQypIumT/+g+HzrD1KT8IJ0+9lAUD/wduZERvAT3w0ShPxvrlyeu+KMmkaoTB239UEhxhabnBuYg==
X-Received: by 2002:aca:50d0:: with SMTP id e199mr2538279oib.133.1585743277082;
        Wed, 01 Apr 2020 05:14:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:474a:: with SMTP id u71ls7709277oia.0.gmail; Wed, 01 Apr
 2020 05:14:36 -0700 (PDT)
X-Received: by 2002:a05:6808:12:: with SMTP id u18mr2656417oic.167.1585743276477;
        Wed, 01 Apr 2020 05:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585743276; cv=none;
        d=google.com; s=arc-20160816;
        b=RHSpH5h6Oy3d0k2KuEya8uT1nHzgyEneOjvwCbBfPpFxDNWKq7EpsEeconOlmP3ya7
         55U+8tWIG/NBkMv9KlMD/ZLq+c7HU/djoGPYYDNsTJakxf8dx127slheK9gDochq4kzV
         Zj/861IU9cf0iQ9M0EAHFFU1LKOIUcyCu3H075yFQDNUUfBTmHf2T7FjgJGh1bEDnG20
         122ytP6lIYAkOSS9H2YS2dDv5FUBDCqw6eJDFPFpN83QoXKjeInrM4ueexjbartoCkPf
         mHc6dhSMN1Xoo2YbZdyLGE9mdTBOczK9uJiQa0iWDGk+zeLsHirC50iAZPKjh4TlQ/bk
         is+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :ironport-sdr:dkim-signature;
        bh=FhgjaeL4wJTRqlFz4wlWr/YhKGMHDBTn2VJaICKYYOY=;
        b=I5dTFRiv7H/Ub+C9WMUlh/s7J4Xw0OFfjh41m+70+9XfXRi+YUwhEF04KeQ7t4o/V3
         42yMgZy3dV9JjSQ2kRqAKmOqfeYHYc2txaFrOm5mAkGsQl91Z+/bGRL4k1j34AiQlANu
         gQEI+oH17UpeiNrJfwjH3O23zs8gXQZldtbqbcmrV3yS/3FANla+2tu1l9/79eljuItf
         mC306rH3oc4jtBuiZLB0FvC1fkA696s/FEQLnk6gPk+CMhTtCuji9dCDtrBICC+RZ7EH
         L0hK3QKh5RkVZZVWVhJIpivqq0chAblvXdr3l5dn0RazMRiEt6aNEUlLQofdWITZwg6E
         RVpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b="id/UBEk7";
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.153 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com. [216.71.145.153])
        by gmr-mx.google.com with ESMTPS id x23si145693oif.2.2020.04.01.05.14.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2020 05:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.153 as permitted sender) client-ip=216.71.145.153;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: wHnyjKuZmTPBksgCb6am2jMuj8CPNCWjxGEiqOdVNYvpl/pmgbzVEHag+vwA1EXCGYepQWVM8Y
 qgU+j9ZCztQ11iaXJbGAbDLqauVv6lAscf+Y8sIku8sS9kdwYNC03yx5Yf+PsUN6tds3+7RCCW
 sbP2OtofLP0gAp/gB9hCwBQUPLFrIq7PVflKJ1BpxB3Lj+JctE5dhe9w8iBKbpqjC3VKOQ4NRr
 nuqgcENyYLfyU3HvHIT9vinJVdz5QxX58JGRANE6njIbPKat9w6LakhjP+Qh4Q8kdEL7wNNHQp
 /dc=
X-SBRS: 2.7
X-MesageID: 15006394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,331,1580792400"; 
   d="scan'208";a="15006394"
Subject: Re: [PATCH v2] x86/smpboot: Remove 486-isms from the modern AP boot
 path
To: Brian Gerst <brgerst@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter
 Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, David Howells
	<dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh Boyer
	<jwboyer@redhat.com>, Steve Wahl <steve.wahl@hpe.com>, Mike Travis
	<mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Kees Cook
	<keescook@chromium.org>, Martin Molnar <martin.molnar.programming@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>, <jailhouse-dev@googlegroups.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <20200331175810.30204-1-andrew.cooper3@citrix.com>
 <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
 <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com>
 <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
 <bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52@citrix.com>
 <CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b1aa5cdf-b446-17b0-6d31-fa8947f67592@citrix.com>
Date: Wed, 1 Apr 2020 13:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b="id/UBEk7";       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.153 as
 permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=citrix.com
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

On 01/04/2020 12:39, Brian Gerst wrote:
> On Wed, Apr 1, 2020 at 5:22 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 31/03/2020 23:53, Brian Gerst wrote:
>>> On Tue, Mar 31, 2020 at 6:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> On 31/03/2020 23:23, Brian Gerst wrote:
>>>>> On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>>>> Linux has an implementation of the Universal Start-up Algorithm (MP spec,
>>>>>> Appendix B.4, Application Processor Startup), which includes unconditionally
>>>>>> writing to the Bios Data Area and CMOS registers.
>>>>>>
>>>>>> The warm reset vector is only necessary in the non-integrated Local APIC case.
>>>>>> UV and Jailhouse already have an opt-out for this behaviour, but blindly using
>>>>>> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.
>>>>>>
>>>>>> We could make this conditional on the integrated-ness of the Local APIC, but
>>>>>> 486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
>>>>>> list and header files as appropriate.
>>>>>>
>>>>>> CC: Thomas Gleixner <tglx@linutronix.de>
>>>>>> CC: Ingo Molnar <mingo@redhat.com>
>>>>>> CC: Borislav Petkov <bp@alien8.de>
>>>>>> CC: "H. Peter Anvin" <hpa@zytor.com>
>>>>>> CC: x86@kernel.org
>>>>>> CC: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> CC: James Morris <jmorris@namei.org>
>>>>>> CC: David Howells <dhowells@redhat.com>
>>>>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> CC: Matthew Garrett <mjg59@google.com>
>>>>>> CC: Josh Boyer <jwboyer@redhat.com>
>>>>>> CC: Steve Wahl <steve.wahl@hpe.com>
>>>>>> CC: Mike Travis <mike.travis@hpe.com>
>>>>>> CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
>>>>>> CC: Arnd Bergmann <arnd@arndb.de>
>>>>>> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
>>>>>> CC: Giovanni Gherdovich <ggherdovich@suse.cz>
>>>>>> CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>>>>>> CC: Len Brown <len.brown@intel.com>
>>>>>> CC: Kees Cook <keescook@chromium.org>
>>>>>> CC: Martin Molnar <martin.molnar.programming@gmail.com>
>>>>>> CC: Pingfan Liu <kernelfans@gmail.com>
>>>>>> CC: linux-kernel@vger.kernel.org
>>>>>> CC: jailhouse-dev@googlegroups.com
>>>>>> Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> ---
>>>>>> v2:
>>>>>>  * Drop logic entirely, rather than retaining support in 32bit builds.
>>>>>> ---
>>>>>>  arch/x86/include/asm/apic.h        |  6 -----
>>>>>>  arch/x86/include/asm/x86_init.h    |  1 -
>>>>>>  arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
>>>>>>  arch/x86/kernel/jailhouse.c        |  1 -
>>>>>>  arch/x86/kernel/platform-quirks.c  |  1 -
>>>>>>  arch/x86/kernel/smpboot.c          | 50 --------------------------------------
>>>>>>  6 files changed, 60 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
>>>>>> index 19e94af9cc5d..5c33f9374b28 100644
>>>>>> --- a/arch/x86/include/asm/apic.h
>>>>>> +++ b/arch/x86/include/asm/apic.h
>>>>>> @@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned long x)
>>>>>>                 return (x >> 24) & 0x0F;
>>>>>>  }
>>>>>>
>>>>>> -/*
>>>>>> - * Warm reset vector position:
>>>>>> - */
>>>>>> -#define TRAMPOLINE_PHYS_LOW            0x467
>>>>>> -#define TRAMPOLINE_PHYS_HIGH           0x469
>>>>>> -
>>>>>>  extern void generic_bigsmp_probe(void);
>>>>>>
>>>>>>  #ifdef CONFIG_X86_LOCAL_APIC
>>>>>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
>>>>>> index 96d9cd208610..006a5d7fd7eb 100644
>>>>>> --- a/arch/x86/include/asm/x86_init.h
>>>>>> +++ b/arch/x86/include/asm/x86_init.h
>>>>>> @@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
>>>>>>  struct x86_legacy_features {
>>>>>>         enum x86_legacy_i8042_state i8042;
>>>>>>         int rtc;
>>>>>> -       int warm_reset;
>>>>>>         int no_vga;
>>>>>>         int reserve_bios_regions;
>>>>>>         struct x86_legacy_devices devices;
>>>>>> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
>>>>>> index ad53b2abc859..5afcfd193592 100644
>>>>>> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
>>>>>> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
>>>>>> @@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
>>>>>>         } else if (!strcmp(oem_table_id, "UVH")) {
>>>>>>                 /* Only UV1 systems: */
>>>>>>                 uv_system_type = UV_NON_UNIQUE_APIC;
>>>>>> -               x86_platform.legacy.warm_reset = 0;
>>>>>>                 __this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
>>>>>>                 uv_set_apicid_hibit();
>>>>>>                 uv_apic = 1;
>>>>>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>>>>>> index 6eb8b50ea07e..d628fe92d6af 100644
>>>>>> --- a/arch/x86/kernel/jailhouse.c
>>>>>> +++ b/arch/x86/kernel/jailhouse.c
>>>>>> @@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
>>>>>>         x86_platform.calibrate_tsc      = jailhouse_get_tsc;
>>>>>>         x86_platform.get_wallclock      = jailhouse_get_wallclock;
>>>>>>         x86_platform.legacy.rtc         = 0;
>>>>>> -       x86_platform.legacy.warm_reset  = 0;
>>>>>>         x86_platform.legacy.i8042       = X86_LEGACY_I8042_PLATFORM_ABSENT;
>>>>>>
>>>>>>         legacy_pic                      = &null_legacy_pic;
>>>>>> diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
>>>>>> index b348a672f71d..d922c5e0c678 100644
>>>>>> --- a/arch/x86/kernel/platform-quirks.c
>>>>>> +++ b/arch/x86/kernel/platform-quirks.c
>>>>>> @@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
>>>>>>  {
>>>>>>         x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
>>>>>>         x86_platform.legacy.rtc = 1;
>>>>>> -       x86_platform.legacy.warm_reset = 1;
>>>>>>         x86_platform.legacy.reserve_bios_regions = 0;
>>>>>>         x86_platform.legacy.devices.pnpbios = 1;
>>>>>>
>>>>>> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
>>>>>> index fe3ab9632f3b..a9f5b511d0b4 100644
>>>>>> --- a/arch/x86/kernel/smpboot.c
>>>>>> +++ b/arch/x86/kernel/smpboot.c
>>>>>> @@ -72,7 +72,6 @@
>>>>>>  #include <asm/fpu/internal.h>
>>>>>>  #include <asm/setup.h>
>>>>>>  #include <asm/uv/uv.h>
>>>>>> -#include <linux/mc146818rtc.h>
>>>>>>  #include <asm/i8259.h>
>>>>>>  #include <asm/misc.h>
>>>>>>  #include <asm/qspinlock.h>
>>>>>> @@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
>>>>>>         return retval;
>>>>>>  }
>>>>>>
>>>>>> -static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
>>>>>> -{
>>>>>> -       unsigned long flags;
>>>>>> -
>>>>>> -       spin_lock_irqsave(&rtc_lock, flags);
>>>>>> -       CMOS_WRITE(0xa, 0xf);
>>>>>> -       spin_unlock_irqrestore(&rtc_lock, flags);
>>>>>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH)) =
>>>>>> -                                                       start_eip >> 4;
>>>>>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
>>>>>> -                                                       start_eip & 0xf;
>>>>>> -}
>>>>>> -
>>>>>> -static inline void smpboot_restore_warm_reset_vector(void)
>>>>>> -{
>>>>>> -       unsigned long flags;
>>>>>> -
>>>>>> -       /*
>>>>>> -        * Paranoid:  Set warm reset code and vector here back
>>>>>> -        * to default values.
>>>>>> -        */
>>>>>> -       spin_lock_irqsave(&rtc_lock, flags);
>>>>>> -       CMOS_WRITE(0, 0xf);
>>>>>> -       spin_unlock_irqrestore(&rtc_lock, flags);
>>>>>> -
>>>>>> -       *((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) = 0;
>>>>>> -}
>>>>>> -
>>>>>>  static void init_freq_invariance(void);
>>>>>>
>>>>>>  /*
>>>>>> @@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
>>>>>>          * the targeted processor.
>>>>>>          */
>>>>>>
>>>>>> -       if (x86_platform.legacy.warm_reset) {
>>>>>> -
>>>>>> -               pr_debug("Setting warm reset code and vector.\n");
>>>>>> -
>>>>>> -               smpboot_setup_warm_reset_vector(start_ip);
>>>>>> -               /*
>>>>>> -                * Be paranoid about clearing APIC errors.
>>>>>> -               */
>>>>>> -               if (APIC_INTEGRATED(boot_cpu_apic_version)) {
>>>>>> -                       apic_write(APIC_ESR, 0);
>>>>>> -                       apic_read(APIC_ESR);
>>>>>> -               }
>>>>>> -       }
>>>>>> -
>>>>>>         /*
>>>>>>          * AP might wait on cpu_callout_mask in cpu_init() with
>>>>>>          * cpu_initialized_mask set if previous attempt to online
>>>>>> @@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
>>>>>>                 }
>>>>>>         }
>>>>>>
>>>>>> -       if (x86_platform.legacy.warm_reset) {
>>>>>> -               /*
>>>>>> -                * Cleanup possible dangling ends...
>>>>>> -                */
>>>>>> -               smpboot_restore_warm_reset_vector();
>>>>>> -       }
>>>>>> -
>>>>>>         return boot_error;
>>>>>>  }
>>>>> You removed x86_platform.legacy.warm_reset in the original patch, but
>>>>> that is missing in V2.
>>>> Second hunk?  Or are you referring to something different?
>>> Removing the warm_reset field from struct x86_legacy_features.
>> Ok, but that is still present as the 2nd hunk of the patch.
> My apologies, Gmail was hiding that section of the patch because it
> was a reply to the original patch.  For future reference, add the
> version number to the title when resubmitting a patch (ie. [PATCH
> v2]).

Erm... is Gmail hiding that too?

Lore thinks it is there:
https://lore.kernel.org/lkml/CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com/

~Andrew

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b1aa5cdf-b446-17b0-6d31-fa8947f67592%40citrix.com.
