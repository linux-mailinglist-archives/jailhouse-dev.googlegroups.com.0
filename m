Return-Path: <jailhouse-dev+bncBAABB24PR72AKGQE3TJLMFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id DA63819A20D
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 00:45:00 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id p8sf24103787ybe.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 15:45:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585694700; cv=pass;
        d=google.com; s=arc-20160816;
        b=OgzOL3Gv36aRctvvi19G8bQG08/NzLjbrkZsfNDyHPh7OuV8qBmBEw+QHOjZFdfyT2
         ISGdhsKiQkgT4Am4uhG/YIbI28CjaiRTzNPHu+5DVPvHrCKWLtSSikszKZ+Bkg3RzWjU
         0AWwmr9rRN09GdeWHbXEJcLCjLsXiOCYbmocUWCdIkuS0S8WwbLszYDpyBSWAFRhkU9V
         MBjx7qc3umK9oXBi1s4g+1FdVddiJs1gp9cCxoe9vFzmkSUF3fwRC9GEwXmtuBRMTHTG
         htSxd1Xks3FyJ3xeCtEQ9u+y4GvPg4Es6O9J4BYL/ehzb5I7BIRBamW2LHQmnA2XmzZo
         iivg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:ironport-sdr:sender
         :dkim-signature;
        bh=dyCcr3Mp/VIg0EG+jocuqb/VXgB5aFNOF2lvZTX4TM8=;
        b=hJ1hQ4yn1hKIOoPrepcu6T6ixjG6QV6e8jEsbN9JpG8ARTEENVLoZz7XVpwj7Qc9Zw
         zN7XLRLBqPTkFfXmi+/QLmxDh54mcn1RiNX/obQIb5s+7eov6oUDZ/wT6aXIXOQX44Vf
         DDhwWaWlnc5uPatMd9FGimZtT7F8rv3zjEy3qAHkZ0cZBJ86iQYkhsYGeegCVXQiMqwC
         v4fUX5Yl7xLfSv1VR9uAlqcqGXTn+bsB9fNxKywBka0RsTpYxmOGybOIEy4rqMi8dPJ8
         5GPWoH8I5SIpVPdOEfpqCW3bCVLATEdOOufHon6zAYQBxlHVDLIaE2Ce47GDJ2fYQV8n
         bPVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b="UIEx9/jh";
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dyCcr3Mp/VIg0EG+jocuqb/VXgB5aFNOF2lvZTX4TM8=;
        b=Rw/MbfSASW7Vrwu6ppeAkvsCY9723TOsJD6uxw3seeO4JfwS1LY3nltaSnpGq542Qq
         14AfT3u36TwbuXO8Pvf6+5tbdy5QHJCm5tT4KVepkdKTghFEpSyGd2J0u5JdbllP6+jO
         ND0wjH26ZrxRXIoxJUyi2pao3l0w1ccEQzZC8+o9+wm8TNgCeGf+cAIkon+ErK1WnRl6
         3HhmR4JBkm7BhJwTwRmYuTL/x26Ai/nvXoTNlQonuXbJ1ONnwXGJNN0c1NtM0PfCvc07
         dM8qT/DF6/HEIZizozZNBngNGwzXAuzLWWJyeOSOOAIoSYPS5vwXX+vJ7agWBSiU8s4+
         UXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:subject:to:cc:references
         :from:message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dyCcr3Mp/VIg0EG+jocuqb/VXgB5aFNOF2lvZTX4TM8=;
        b=um2JljNdC7DVxCI6dP+Mc34711voN4m/tmKStY0EPfFl8TLLxoExxcLvn8Oqi7VeGw
         +xDJzst+rFKHAfsa1NVkU+BMfG6ycxfTXXpf5O2VVYQcKgi0ffIkW8v8qg15BV5ssh5/
         TkQrkPXonf+INX7VL+dBQYToVUJEnKhw7cEMVcdzNqqOC1nJ25hJa8EAqMSCErnm9qXq
         FfGjxU9fylchMp7YlFlEum+EkbgtDNT4ggX3KDBP6rZfbZ0a6UbbDC08LCNnRBObyJGs
         QWbSuyXSWRB/cpgM3zeCs/MA3K6gFnDIn7+uHUxiB6UXGUmv1dC9o4eNb3POXBrf0hlU
         eAiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3Ab6jKsa/s5njcZyFWcBBDKHA7M8RMO+OZ7h9vv22c/XJSZyJ7
	OtA0JsPqfGNC6LMndB4CxCY=
X-Google-Smtp-Source: ADFU+vsBDTH3cXGNf84bmiiVUMMRVeLa+xkYRUkEYgXRm/gCGRqii82rb//v/DLyabMfj46xrVW7HQ==
X-Received: by 2002:a25:602:: with SMTP id 2mr32064904ybg.359.1585694699877;
        Tue, 31 Mar 2020 15:44:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2ace:: with SMTP id q197ls7839554ybq.1.gmail; Tue, 31
 Mar 2020 15:44:59 -0700 (PDT)
X-Received: by 2002:a25:870f:: with SMTP id a15mr21748329ybl.397.1585694699111;
        Tue, 31 Mar 2020 15:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585694699; cv=none;
        d=google.com; s=arc-20160816;
        b=Ht3hcdqAoNNfLRfPYGqUOpTW2nchv30ubzJ/9qLIJ7V4LZnxJTCcS24ZdpMA21dXyu
         nF8uiKdt2RPL+gDbFP+DedJntC1FOsNSADsO7HqcFdL0d1fp8zrXSWXul3h2eo0vEOed
         7EUSVha2sB4iL64pjDp+5l6zXi4eq00gT+NeUQwRurHVVoMUO+Pfgavyn3Q72KagAjSR
         6fNuqvdu73bsv7dD3Wez9vMPd+EqMm4MvoiBjW+jILQn0CAP6RtxaZDjhKVlD52yDdgq
         13yCZ6kYmwHhAr0rI/DO/cVyxeE617fsF9cLqFME7zIjba+xPj5iA8/zoq7zjPixT2uV
         /F/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :ironport-sdr:dkim-signature;
        bh=S6vZJt+U0DmGTyltaTcmPdQT7L0ggGOum5+sNA1bm0o=;
        b=uI0MvB9K9BmpMLvda7m1qIg8D+k7THVKqWPP1eaPXmAUOYRr+0Fc8zMUGcMCM+5sbq
         qjjq+oSm5fDFo20femKp1s6fSmavTxrV9ui0TE+hxzfG1V5ldHGCDVFf//+HDHYD1qDe
         Ev7lRO9IkBCwPEWpCzW8grqYiWUjQ0Vkpp9X633a6pyqc9RLCcH0/Qr2Q26krSOwiP0D
         Ol7WAGt8x0cSgdEZTgzxNwslQMks4g/7yDBx2ktpwOAPAB2UX1KOG0t1mmsYT95Mcr07
         Esgy1vPO699MyVi59L2DJeSl3akWuXwWL/XtOdm713js2Wb130s2FoJ1NlklpLLkMOZN
         HbKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b="UIEx9/jh";
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com. [216.71.145.142])
        by gmr-mx.google.com with ESMTPS id l1si21022ybt.2.2020.03.31.15.44.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Mar 2020 15:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as permitted sender) client-ip=216.71.145.142;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: NAsrma9tTEcl7LEQG8wF+MJQy+sbYhN4aIQmAw3bzH5irOH8CuvS5tQcv70dVtPgJ/eOeWFMgK
 0GVskZU5r8VQSj4fze7AD4mXtBB1OO3nUUzuA6IfIIHfPAZ3UzuYlYJfuQ2D6KMqh29JkyIGU/
 zvPJw9VyuEYO8jQ/K+5iLLbmuWxti+Bdjjdqw40KUOk58Jio/4asewt8lumNae23CVmvIftXjj
 CAM7XEb1/RnahfwT8qG2CssS7ipQ4sgDYuEkc5G2ptWC3xQn5TOqGdCax5jvpkky2k+k5n6r3C
 un8=
X-SBRS: 2.7
X-MesageID: 15185279
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,329,1580792400"; 
   d="scan'208";a="15185279"
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
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com>
Date: Tue, 31 Mar 2020 23:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b="UIEx9/jh";       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.142 as
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

On 31/03/2020 23:23, Brian Gerst wrote:
> On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com>=
 wrote:
>> Linux has an implementation of the Universal Start-up Algorithm (MP spec=
,
>> Appendix B.4, Application Processor Startup), which includes uncondition=
ally
>> writing to the Bios Data Area and CMOS registers.
>>
>> The warm reset vector is only necessary in the non-integrated Local APIC=
 case.
>> UV and Jailhouse already have an opt-out for this behaviour, but blindly=
 using
>> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever=
.
>>
>> We could make this conditional on the integrated-ness of the Local APIC,=
 but
>> 486-era SMP isn't supported.  Drop the logic completely, tidying up the =
includ
>> list and header files as appropriate.
>>
>> CC: Thomas Gleixner <tglx@linutronix.de>
>> CC: Ingo Molnar <mingo@redhat.com>
>> CC: Borislav Petkov <bp@alien8.de>
>> CC: "H. Peter Anvin" <hpa@zytor.com>
>> CC: x86@kernel.org
>> CC: Jan Kiszka <jan.kiszka@siemens.com>
>> CC: James Morris <jmorris@namei.org>
>> CC: David Howells <dhowells@redhat.com>
>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>> CC: Matthew Garrett <mjg59@google.com>
>> CC: Josh Boyer <jwboyer@redhat.com>
>> CC: Steve Wahl <steve.wahl@hpe.com>
>> CC: Mike Travis <mike.travis@hpe.com>
>> CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
>> CC: Arnd Bergmann <arnd@arndb.de>
>> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
>> CC: Giovanni Gherdovich <ggherdovich@suse.cz>
>> CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>> CC: Len Brown <len.brown@intel.com>
>> CC: Kees Cook <keescook@chromium.org>
>> CC: Martin Molnar <martin.molnar.programming@gmail.com>
>> CC: Pingfan Liu <kernelfans@gmail.com>
>> CC: linux-kernel@vger.kernel.org
>> CC: jailhouse-dev@googlegroups.com
>> Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> v2:
>>  * Drop logic entirely, rather than retaining support in 32bit builds.
>> ---
>>  arch/x86/include/asm/apic.h        |  6 -----
>>  arch/x86/include/asm/x86_init.h    |  1 -
>>  arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
>>  arch/x86/kernel/jailhouse.c        |  1 -
>>  arch/x86/kernel/platform-quirks.c  |  1 -
>>  arch/x86/kernel/smpboot.c          | 50 -------------------------------=
-------
>>  6 files changed, 60 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
>> index 19e94af9cc5d..5c33f9374b28 100644
>> --- a/arch/x86/include/asm/apic.h
>> +++ b/arch/x86/include/asm/apic.h
>> @@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned=
 long x)
>>                 return (x >> 24) & 0x0F;
>>  }
>>
>> -/*
>> - * Warm reset vector position:
>> - */
>> -#define TRAMPOLINE_PHYS_LOW            0x467
>> -#define TRAMPOLINE_PHYS_HIGH           0x469
>> -
>>  extern void generic_bigsmp_probe(void);
>>
>>  #ifdef CONFIG_X86_LOCAL_APIC
>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_=
init.h
>> index 96d9cd208610..006a5d7fd7eb 100644
>> --- a/arch/x86/include/asm/x86_init.h
>> +++ b/arch/x86/include/asm/x86_init.h
>> @@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
>>  struct x86_legacy_features {
>>         enum x86_legacy_i8042_state i8042;
>>         int rtc;
>> -       int warm_reset;
>>         int no_vga;
>>         int reserve_bios_regions;
>>         struct x86_legacy_devices devices;
>> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x=
2apic_uv_x.c
>> index ad53b2abc859..5afcfd193592 100644
>> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
>> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
>> @@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_=
id, char *_oem_table_id)
>>         } else if (!strcmp(oem_table_id, "UVH")) {
>>                 /* Only UV1 systems: */
>>                 uv_system_type =3D UV_NON_UNIQUE_APIC;
>> -               x86_platform.legacy.warm_reset =3D 0;
>>                 __this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apici=
d.s.pnode_shift);
>>                 uv_set_apicid_hibit();
>>                 uv_apic =3D 1;
>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>> index 6eb8b50ea07e..d628fe92d6af 100644
>> --- a/arch/x86/kernel/jailhouse.c
>> +++ b/arch/x86/kernel/jailhouse.c
>> @@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
>>         x86_platform.calibrate_tsc      =3D jailhouse_get_tsc;
>>         x86_platform.get_wallclock      =3D jailhouse_get_wallclock;
>>         x86_platform.legacy.rtc         =3D 0;
>> -       x86_platform.legacy.warm_reset  =3D 0;
>>         x86_platform.legacy.i8042       =3D X86_LEGACY_I8042_PLATFORM_AB=
SENT;
>>
>>         legacy_pic                      =3D &null_legacy_pic;
>> diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platfor=
m-quirks.c
>> index b348a672f71d..d922c5e0c678 100644
>> --- a/arch/x86/kernel/platform-quirks.c
>> +++ b/arch/x86/kernel/platform-quirks.c
>> @@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
>>  {
>>         x86_platform.legacy.i8042 =3D X86_LEGACY_I8042_EXPECTED_PRESENT;
>>         x86_platform.legacy.rtc =3D 1;
>> -       x86_platform.legacy.warm_reset =3D 1;
>>         x86_platform.legacy.reserve_bios_regions =3D 0;
>>         x86_platform.legacy.devices.pnpbios =3D 1;
>>
>> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
>> index fe3ab9632f3b..a9f5b511d0b4 100644
>> --- a/arch/x86/kernel/smpboot.c
>> +++ b/arch/x86/kernel/smpboot.c
>> @@ -72,7 +72,6 @@
>>  #include <asm/fpu/internal.h>
>>  #include <asm/setup.h>
>>  #include <asm/uv/uv.h>
>> -#include <linux/mc146818rtc.h>
>>  #include <asm/i8259.h>
>>  #include <asm/misc.h>
>>  #include <asm/qspinlock.h>
>> @@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
>>         return retval;
>>  }
>>
>> -static inline void smpboot_setup_warm_reset_vector(unsigned long start_=
eip)
>> -{
>> -       unsigned long flags;
>> -
>> -       spin_lock_irqsave(&rtc_lock, flags);
>> -       CMOS_WRITE(0xa, 0xf);
>> -       spin_unlock_irqrestore(&rtc_lock, flags);
>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH))=
 =3D
>> -                                                       start_eip >> 4;
>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
=3D
>> -                                                       start_eip & 0xf;
>> -}
>> -
>> -static inline void smpboot_restore_warm_reset_vector(void)
>> -{
>> -       unsigned long flags;
>> -
>> -       /*
>> -        * Paranoid:  Set warm reset code and vector here back
>> -        * to default values.
>> -        */
>> -       spin_lock_irqsave(&rtc_lock, flags);
>> -       CMOS_WRITE(0, 0xf);
>> -       spin_unlock_irqrestore(&rtc_lock, flags);
>> -
>> -       *((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =3D 0;
>> -}
>> -
>>  static void init_freq_invariance(void);
>>
>>  /*
>> @@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struc=
t task_struct *idle,
>>          * the targeted processor.
>>          */
>>
>> -       if (x86_platform.legacy.warm_reset) {
>> -
>> -               pr_debug("Setting warm reset code and vector.\n");
>> -
>> -               smpboot_setup_warm_reset_vector(start_ip);
>> -               /*
>> -                * Be paranoid about clearing APIC errors.
>> -               */
>> -               if (APIC_INTEGRATED(boot_cpu_apic_version)) {
>> -                       apic_write(APIC_ESR, 0);
>> -                       apic_read(APIC_ESR);
>> -               }
>> -       }
>> -
>>         /*
>>          * AP might wait on cpu_callout_mask in cpu_init() with
>>          * cpu_initialized_mask set if previous attempt to online
>> @@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struc=
t task_struct *idle,
>>                 }
>>         }
>>
>> -       if (x86_platform.legacy.warm_reset) {
>> -               /*
>> -                * Cleanup possible dangling ends...
>> -                */
>> -               smpboot_restore_warm_reset_vector();
>> -       }
>> -
>>         return boot_error;
>>  }
> You removed x86_platform.legacy.warm_reset in the original patch, but
> that is missing in V2.

Second hunk?=C2=A0 Or are you referring to something different?

~Andrew

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c46bcb6d-4256-2d65-9cd9-33e010846de4%40citrix.com.
