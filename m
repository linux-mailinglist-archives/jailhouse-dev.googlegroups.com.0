Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLWV6XVAKGQE5LDW3RQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id B779997F8D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Aug 2019 18:00:47 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id i10sf1661360edv.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Aug 2019 09:00:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566403247; cv=pass;
        d=google.com; s=arc-20160816;
        b=EeakTrALOMVF82Fly/2tNcKtef6KSTYbGuxiuwKnNfRLZSGNEmCuBnt/GNXIdUXepN
         5uXDXDDBv6oOi++etI2pN8zAMx305v11mF3VrOVluZWP7jZdho1uFZ/OY1iXSVEhyH47
         F2xEIkfaBMSRk66nRVJNEKSF+wrI9UOZqyIctKdO5ym46l9Ej1V1KcQIUo0tLUc7r7xH
         uXj6Q2RNPUxcfNIzvpU+TJXzXpTTIOXe9m536+8h4U1YvzsVhe2Zhye8iA1QKc+nUZ4N
         Uhm4VqG3Mjcf9KwMiF+CaDOsQQJrMkCfvTyNn5bUTFvaZ3YxgDApaWDoKjpN/TwVq5Uf
         v8BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=pJS1kcsJ66JujKr3aM51ZlXfQP3xszV/29rQUZaLOKU=;
        b=zjmktzpXfw36NVozL1i+bnn2VRweyYpgE4pJhEr4L0qrXTZ6l58crndfJp37MmCLn0
         ckyXlGOErlnWi7FoBxJ5VxBXVMV2qAdYg5mZzi9JpShbpZPP2AVKaGrgxu5PwvJjxA6e
         AKfLcRiT6wBMAWx47PvOtjZ0no0Ews3ES25aqkIjPG4VjtrbBVCjU836KD6iZNmp05r4
         cU8qsfTLn07JtJRVBRjoS0cDqf7dZJgRvhIwkuwARMGvCSpbQ3CWd1KRrbFARk388CWO
         IlnB50JyAakflgHcE2hfQi+nZqHdVK5zUUmQiwVJVc5XgNNr0nwQHJhnOfE/iWGYsENv
         XeeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PSbXxmLe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pJS1kcsJ66JujKr3aM51ZlXfQP3xszV/29rQUZaLOKU=;
        b=Wq9qqSSHgJtib60BDzjR37aeNyhuRQZLA1Nq0sei5eIEMfXdY4OB5Fc1P9ed/x5atW
         PE1tpcyhRVQbs8Cd0Gpa8ricoHWJ55WZtCqvghA+sfFTEy/Lw4izr0j1Ckw5yiCASV47
         edT59CYCkvcCfmy0iGHKagR7oThYWfY4lG4VDFsm2OHlvmHGVomezJqcAZ4NmOY5dCC4
         KsY1Edr1G44tk78Ys2SL7iQoz+KvhYlI8ns2YdOlXw30hH3dRWtYPn4f1i/l93K+R836
         TNWK0KKw9BIDwU7rdwZOMa+Gtw7kEmkou50F4zrV3ZrEp/v2omoWC5FXr+uy2IL1Pzfk
         wgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pJS1kcsJ66JujKr3aM51ZlXfQP3xszV/29rQUZaLOKU=;
        b=Cax4PdvbSIJWWcXOZYkN/L3UWRAr+/b2hzEZuAJa+17yWjdPZFpGLmSFEjG2lYUoNr
         5MIylU7c9asAbZ0hC2JfHdRG0ADs7i8RdCeAkRdC/cjqToMOCXw+KMLfclVDf8SVAyFL
         msT4cla6pWBbYsDX3XGLWO+H0nrS2bMU3iaKTgCDwOZO887yNxq8btehQxzmPwUHUDIY
         aX39Cxxi5ZXcEiO9EkQ6idU+b/CzZ7Yl9v5JK5BmkEC0eVTlU4t7GPx5jkD6YMbpBUE+
         IKfYBYlbs/zNLsVxUU+mccf4ZQQYIWw5xcweo4fJ8lsO8D3BhAEl6mlgz/MD8I19yP+f
         tRYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVyB6JOIf4DrybLeMV8D+0iubDRCMmVkhl85QauGBEX5YceAiIV
	E1R/zaHTbwkxKKPQpj/d/Ro=
X-Google-Smtp-Source: APXvYqwxxC83gpgRw5WYb8NeOEjDgc/4VN+2YiCLTThGdfBV0gVzMVwpZV0uruZ73JH440p0hrmCGw==
X-Received: by 2002:a50:f051:: with SMTP id u17mr36676919edl.300.1566403247343;
        Wed, 21 Aug 2019 09:00:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:c28a:: with SMTP id o10ls920946edf.8.gmail; Wed, 21 Aug
 2019 09:00:46 -0700 (PDT)
X-Received: by 2002:a50:ec18:: with SMTP id g24mr9478362edr.259.1566403246407;
        Wed, 21 Aug 2019 09:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566403246; cv=none;
        d=google.com; s=arc-20160816;
        b=almtQzgGkilDKyKM/ysRkbLfksPMDPdd/l9H4c7qsdmGNwv7hcpjhW1QsJOomvep4d
         nL4rNNmERJ0s2Gz7/Su1QTsJ87VQgSxjG0XZl4FVwPQT3jkciYOI1mEo36gWo9KUZkaP
         JqTSGA2Lgshyj5zo083D2DrK9Tq5UDQJN3EeC357PhTA08oQXAHOzpGX7Sn8e6TemMNN
         qrbiBKOUN8QkQa2jInYx8OCx3BifDtm+pA6p9I3sSUOwpFz0nMnR9cmv5wA8tgPJXYA3
         tDHekJOXZ+mh8P/1+H1z3u/Cu67cV3LM2POexL4bKrMhCawlbVC854C3hGMp1h+sHhfG
         DB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=7hp5FN6KPTOleo/A9Wi5kbhb0mFZ0VrNuyyz7jIjal4=;
        b=un5Rawu1VIG2N/V43N+yJcABXxqKE8WMYzkSrDub3J2NXDIHIGC/A1rAMSyOElMI6j
         4MRvv4N6DXmjWAO36oJnrXEv/CrPnhQYrWJyL4erAFf9tdE0VTSKQ5JxfMjqLEmlMzzZ
         GrKkh9Yqpe61ijMKnlkoftPeyB5lnFJZLp0rMEGXBCntfOarO70GhMxB7WerblufWUaS
         IA6NdfRtLEYIjwNFqufauMPp4X27rZmNPm329jxXcMZrlCwyfYSauYnIiX23D/QtBvCJ
         vhJOZMlubLLuh+YO9fy2M7EWpAFF5hvUftxc8pD2DqUuVSdrIq/jszbJOoipvnWLQkSG
         PZSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PSbXxmLe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id m3si885505edq.0.2019.08.21.09.00.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 09:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46DC7K5Z5GzyBn;
	Wed, 21 Aug 2019 18:00:45 +0200 (CEST)
Received: from [IPv6:2001:67c:20a1:1192:e70b:6dba:fe20:fe70]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 21 Aug
 2019 18:00:44 +0200
Subject: Re: [PATCH v3 1/2] x86/jailhouse: improve setup data version
 comparison
To: Jan Kiszka <jan.kiszka@siemens.com>, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<jailhouse-dev@googlegroups.com>
CC: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
 <20190819183408.988013-2-ralf.ramsauer@oth-regensburg.de>
 <dff212b5-d42b-9791-de27-36865fe8ba55@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <b7b1ee8b-5363-0f9c-0419-357f042edcc5@oth-regensburg.de>
Date: Wed, 21 Aug 2019 18:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dff212b5-d42b-9791-de27-36865fe8ba55@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PSbXxmLe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 8/20/19 9:25 PM, Jan Kiszka wrote:
> On 19.08.19 20:34, Ralf Ramsauer wrote:
>> We will soon introduce a new setup_data version and extend the
>> structure. This requires some preparational work for the sanity check of
>> the header and the check of the version.
>>
>> Use the following strategy:
>>
>> 1. Ensure that the header declares at least enough space for the version
>> =C2=A0=C2=A0=C2=A0 and the compatible_version as we must hold that field=
s for any
>> =C2=A0=C2=A0=C2=A0 version. Furthermore, the location and semantics of t=
hose fields will
>> =C2=A0=C2=A0=C2=A0 never change.
>>
>> 2. Copy over data -- as much as we can. The length is either limited by
>> =C2=A0=C2=A0=C2=A0 the header length, or the length of setup_data.
>>
>> 3. Things are now in place -- sanity check if the header length complies
>> =C2=A0=C2=A0=C2=A0 the actual version.
>>
>> For future versions of the setup_data, only step 3 requires alignment.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 arch/x86/include/uapi/asm/bootparam.h | 22 +++++++-----
>> =C2=A0 arch/x86/kernel/jailhouse.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 50 +++++++++++++++++----------
>> =C2=A0 2 files changed, 44 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/bootparam.h
>> b/arch/x86/include/uapi/asm/bootparam.h
>> index a06cbf019744..6163b1afa7b3 100644
>> --- a/arch/x86/include/uapi/asm/bootparam.h
>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>> @@ -137,15 +137,19 @@ struct boot_e820_entry {
>> =C2=A0=C2=A0 * setup data structure.
>> =C2=A0=C2=A0 */
>> =C2=A0 struct jailhouse_setup_data {
>> -=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 version;
>> -=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 compatible_version;
>> -=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 pm_timer_address;
>> -=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 num_cpus;
>> -=C2=A0=C2=A0=C2=A0 __u64=C2=A0=C2=A0=C2=A0 pci_mmconfig_base;
>> -=C2=A0=C2=A0=C2=A0 __u32=C2=A0=C2=A0=C2=A0 tsc_khz;
>> -=C2=A0=C2=A0=C2=A0 __u32=C2=A0=C2=A0=C2=A0 apic_khz;
>> -=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=C2=A0 standard_ioapic;
>> -=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=C2=A0 cpu_ids[255];
>> +=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 vers=
ion;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 comp=
atible_version;
>> +=C2=A0=C2=A0=C2=A0 } __attribute__((packed)) hdr;
>> +=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 pm_t=
imer_address;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16=C2=A0=C2=A0=C2=A0 num_=
cpus;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64=C2=A0=C2=A0=C2=A0 pci_=
mmconfig_base;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32=C2=A0=C2=A0=C2=A0 tsc_=
khz;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32=C2=A0=C2=A0=C2=A0 apic=
_khz;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=C2=A0 stand=
ard_ioapic;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=C2=A0 cpu_i=
ds[255];
>> +=C2=A0=C2=A0=C2=A0 } __attribute__((packed)) v1;
>> =C2=A0 } __attribute__((packed));
>> =C2=A0 =C2=A0 /* The so-called "zeropage" */
>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>> index 108c48d0d40e..fc65ed3346ac 100644
>> --- a/arch/x86/kernel/jailhouse.c
>> +++ b/arch/x86/kernel/jailhouse.c
>> @@ -21,6 +21,8 @@
>> =C2=A0 #include <asm/setup.h>
>> =C2=A0 =C2=A0 static __initdata struct jailhouse_setup_data setup_data;
>> +#define SETUP_DATA_V1_LEN=C2=A0=C2=A0=C2=A0 (sizeof(setup_data.hdr) +
>> sizeof(setup_data.v1))
>> +
>> =C2=A0 static unsigned int precalibrated_tsc_khz;
>> =C2=A0 =C2=A0 static uint32_t jailhouse_cpuid_base(void)
>> @@ -44,7 +46,7 @@ static void jailhouse_get_wallclock(struct
>> timespec64 *now)
>> =C2=A0 =C2=A0 static void __init jailhouse_timer_init(void)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 lapic_timer_frequency =3D setup_data.apic_khz * (100=
0 / HZ);
>> +=C2=A0=C2=A0=C2=A0 lapic_timer_frequency =3D setup_data.v1.apic_khz * (=
1000 / HZ);
>> =C2=A0 }
>> =C2=A0 =C2=A0 static unsigned long jailhouse_get_tsc(void)
>> @@ -87,14 +89,14 @@ static void __init
>> jailhouse_get_smp_config(unsigned int early)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register_lapic_address(0xfee00000)=
;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 for (cpu =3D 0; cpu < setup_data.num_cpus; cp=
u++) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic_processor_info(setup=
_data.cpu_ids[cpu],
>> +=C2=A0=C2=A0=C2=A0 for (cpu =3D 0; cpu < setup_data.v1.num_cpus; cpu++)=
 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic_processor_info(setup=
_data.v1.cpu_ids[cpu],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo=
ot_cpu_apic_version);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 smp_found_config =3D 1;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (setup_data.standard_ioapic) {
>> +=C2=A0=C2=A0=C2=A0 if (setup_data.v1.standard_ioapic) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mp_register_ioapi=
c(0, 0xfec00000, gsi_top, &ioapic_cfg);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Registe=
r 1:1 mapping for legacy UART IRQs 3 and 4 */
>> @@ -125,9 +127,9 @@ static int __init jailhouse_pci_arch_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcibios_last_bus =
=3D 0xff;
>> =C2=A0 =C2=A0 #ifdef CONFIG_PCI_MMCONFIG
>> -=C2=A0=C2=A0=C2=A0 if (setup_data.pci_mmconfig_base) {
>> +=C2=A0=C2=A0=C2=A0 if (setup_data.v1.pci_mmconfig_base) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_mmconfig_add(=
0, 0, pcibios_last_bus,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_data.pci_mmconfig_base);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_data.v1.pci_mmconfig_base);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_mmcfg_arch_in=
it();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 #endif
>> @@ -138,6 +140,7 @@ static int __init jailhouse_pci_arch_init(void)
>> =C2=A0 static void __init jailhouse_init_platform(void)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 pa_data =3D boot_params.hdr.setup_dat=
a;
>> +=C2=A0=C2=A0=C2=A0 unsigned long setup_data_len;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct setup_data header;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *mapping;
>> =C2=A0 @@ -162,16 +165,8 @@ static void __init jailhouse_init_platform(v=
oid)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(&header, m=
apping, sizeof(header));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_memunmap(ma=
pping, sizeof(header));
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (header.type =3D=
=3D SETUP_JAILHOUSE &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 head=
er.len >=3D sizeof(setup_data)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa_d=
ata +=3D offsetof(struct setup_data, data);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mapp=
ing =3D early_memremap(pa_data, sizeof(setup_data));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memc=
py(&setup_data, mapping, sizeof(setup_data));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 earl=
y_memunmap(mapping, sizeof(setup_data));
>> -
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (header.type =3D=3D SETUP=
_JAILHOUSE)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa_data =
=3D header.next;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -179,13 +174,26 @@ static void __init jailhouse_init_platform(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pa_data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Jailhouse:=
 No valid setup data found");
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (setup_data.compatible_version >
>> JAILHOUSE_SETUP_REQUIRED_VERSION)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Jailhouse: Unsupporte=
d setup data structure");
>> +=C2=A0=C2=A0=C2=A0 /* setup data must at least contain the header */
>> +=C2=A0=C2=A0=C2=A0 if (header.len < sizeof(setup_data.hdr))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unsupported;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 pmtmr_ioport =3D setup_data.pm_timer_address;
>> +=C2=A0=C2=A0=C2=A0 pa_data +=3D offsetof(struct setup_data, data);
>> +=C2=A0=C2=A0=C2=A0 setup_data_len =3D min(sizeof(setup_data), (unsigned=
 long)header.len);
>> +=C2=A0=C2=A0=C2=A0 mapping =3D early_memremap(pa_data, setup_data_len);
>> +=C2=A0=C2=A0=C2=A0 memcpy(&setup_data.hdr, mapping, setup_data_len);
>=20
> This is now nitpicking, but was there a particular reason to target
> setup_data.hdr with the copy, rather than just setup_data?

Hmm, not really. Must be a fragment of a earlier version of the patch.
Can be changed to &setup_data.

  Ralf

>=20
>> +=C2=A0=C2=A0=C2=A0 early_memunmap(mapping, setup_data_len);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (setup_data.hdr.version =3D=3D 0 ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_data.hdr.compatible_ve=
rsion !=3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_SETUP_REQUIRED_VER=
SION ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (setup_data.hdr.version >=3D=
 1 && header.len < SETUP_DATA_V1_LEN))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unsupported;
>> +
>> +=C2=A0=C2=A0=C2=A0 pmtmr_ioport =3D setup_data.v1.pm_timer_address;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug("Jailhouse: PM-Timer IO Port: %#=
x\n", pmtmr_ioport);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 precalibrated_tsc_khz =3D setup_data.tsc_khz;
>> +=C2=A0=C2=A0=C2=A0 precalibrated_tsc_khz =3D setup_data.v1.tsc_khz;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN=
_FREQ);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_probe =3D 0;
>> @@ -195,6 +203,10 @@ static void __init jailhouse_init_platform(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * are none in a non-root cell.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disable_acpi();
>> +=C2=A0=C2=A0=C2=A0 return;
>> +
>> +unsupported:
>> +=C2=A0=C2=A0=C2=A0 panic("Jailhouse: Unsupported setup data structure")=
;
>> =C2=A0 }
>> =C2=A0 =C2=A0 bool jailhouse_paravirt(void)
>>
>=20
> In any case:
>=20
> Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b7b1ee8b-5363-0f9c-0419-357f042edcc5%40oth-regensburg.de.
