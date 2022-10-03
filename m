Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBBG7L5WMQMGQEUPJ2E6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id D84055F3A0E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Oct 2022 01:51:57 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id l23-20020a17090a071700b0020a8232ddb1sf2182419pjl.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 16:51:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664841116; cv=pass;
        d=google.com; s=arc-20160816;
        b=iZiQ7wj1VWNjOA7xA1iWCBWVEiF9eDEreP/SXnB8maro8u2B8NpeeFeRi3Lio4wCrZ
         EUhSPS5/fAHXtPc8hTmDE1Kl+Lzt9uYMXyXjkX7UwEVQ+MpiQxA7bIxu9jbBc7LTNbFj
         DGzhMpbm4VHvwoq0sIJOJC6lDDE35L6gLInWyaI3g/kY1qglWJ/qTqMLBNUW7h7MIAQg
         E/ZQ9WJbqXIBGdsZHiJas93je56qYQVMc49QP429FliF085MlruOXgprjm1M6Gis39h6
         hWtgcHzaEbhhPqhpoAJyFCztZcMBXNyBxagqLFSt04pnPvGcVJIBD1svtAeA15OHkr9/
         G7mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:user-agent:subject
         :cc:to:from:date:dkim-filter:sender:dkim-signature;
        bh=np1ltoCf9nLhuS6WqYD6XZLpEtwEI78z6T6KJB/b5GQ=;
        b=PhDKhogSytmsAwcGcjJUPh/qhfatD6mAkD15ZlNGtCCYLeodzFE+XleKAW7KaYAN3w
         HNpzSTiDxUpJUcRs6ygftyp+GdGgP/iJvi2ko8ob7KljUP4oCSuAcft6K6Yg6e5OZNgI
         RlRUtMXkIBSdvVRxIUT6Nb3ggm15j+zPDfW6ZAfAIS71nQbfrV6zfcfZVnWHerhlw9E5
         bLYfs4E5L+eZdhjFCck+2Cy4BDAgHTkk0AZ4ZJq+jixnaNaw6ArfAuqBnIIYM1221oGg
         HY7a5o2RiguG90eCKsxv8mZQvJUdWN2N9jzr8LPhE6q756e9N2TaC/ZpHAkZ95oFUH6W
         ib0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@zytor.com header.s=2022090501 header.b=ri09LYJh;
       spf=pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date
         :dkim-filter:sender:from:to:cc:subject:date;
        bh=np1ltoCf9nLhuS6WqYD6XZLpEtwEI78z6T6KJB/b5GQ=;
        b=U6bHvSURgRd1vOrVs/m5d+BK2m3Qn8M/qEhsUA3TaLNSPoYmrrW6EZ+amwOcjkONtN
         q3duP8oGcCW0AqFlSt7jNtTXrSvHRnmjvDdwI8q9gjkd4Hvq2qYA8ehUHcVqaDC9HANl
         eTQ5xMlItDI/U313ZsgzeHwyGuoPM0K1meZd7tQc7TCh4FbMTdfPtmKi8Ms0itgPLH2h
         3L2HxlZ8i51zK7lArrfj10RrSi3smX0qMBlssCBcBaUxUWI9sbxAQF5z6v6hD/SLH/po
         wuzwhqZvosf73a/ntuInZz3ayg9lUpu2HTtryeUhbQy7UBWe2lTzfznUXAuBPL59TGff
         V3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-filter
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=np1ltoCf9nLhuS6WqYD6XZLpEtwEI78z6T6KJB/b5GQ=;
        b=qTuF7TdRylKrpg22shXPNd6RI+katNtT1/OOBuWjboBgkBL6Ln0kE2wNNRe1KUMt3a
         v39yBQrov7EhVVhosRDtMZERf2yKmfzugSfHHN7a5T9DtFabg5AtwjKm6bdkJZ0lKv3l
         6Xw2X7b8fk14QI8smt/YvbN191ReyniliwmcT1NLwg6y1UxjJmHwahyLcrifo4IWxHsB
         RJrrPVYZH3HoewjQiNnjkft2jRfbo0zG4SItOcMOIiKgc0tOY3ejhKu/BhEYOWifAcXJ
         nJZcCBi7jbnxR6E1fWLA6G0VnFwGsy3FVIjZpuugwL0tpJw3a4R7nmlPHsPdmXOWQFa2
         uq+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf13Ud3NDo+jMTXu/SUfuyzpCd7gTiztWkB55iuIOIJODXnFlXGf
	7WDec+R4bWllcPJSRFpA/+8=
X-Google-Smtp-Source: AMsMyM7zT0sJhpUir99zsVF27mPX71QzabHXlzPNxOg98qxeD/ehMmjST+564pWFvvYjdPPrSPZ1rA==
X-Received: by 2002:a17:90b:17c9:b0:202:640c:ec5 with SMTP id me9-20020a17090b17c900b00202640c0ec5mr14626496pjb.71.1664841116189;
        Mon, 03 Oct 2022 16:51:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:1356:b0:556:57e1:ca28 with SMTP id
 k22-20020a056a00135600b0055657e1ca28ls6805116pfu.1.-pod-prod-gmail; Mon, 03
 Oct 2022 16:51:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:24d4:b0:541:11bd:dd24 with SMTP id d20-20020a056a0024d400b0054111bddd24mr25145806pfv.66.1664841114675;
        Mon, 03 Oct 2022 16:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664841114; cv=none;
        d=google.com; s=arc-20160816;
        b=mglNxZ7ZtmJ5aiec657oiET/u7K3BvUaQjlivDxpDAqQyAharFgr9reU0+tkRlTkhp
         3wXXZmL1frrrIyNYAzD4VdPFXPVdXY+JeYDcr7Ew5Afdqii0iI3YUW9WolvKu7lDSEoO
         /JUleBcrMbcSGyJGkktppv20e8h9yPSWXL7Ta44Umh1uzC0wwJfah5KqoU+MISpQjepR
         Li0yi/pM6+grU2qOB0Xmgjctf82r46pmJvTEwQx5zDUxA9u0laXNNQ9/dFl1wIMCgacE
         bHP5fgDAsV6qkrPLnaAoBcDo2NKqGqCEArYMqRvs14NancpQmdvTAH2J0JMLNi3WS8DY
         MUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature
         :dkim-filter;
        bh=D7TBwA2zb1cncUrYgDx3mpO7N7pu2xIjAZUrkR2oYU0=;
        b=PG/frzWVb/6JCI5KW1UmeymJe6yS5WYRz9zparmq7tEB8AnGzOXsqd3lsTFuGsMqL8
         b6wSKukJPCuLxSwWeO/irah8twbzjO5HKAkyPZChowf67GFlKSEbMyVOlXADBrmY5Ma0
         7uKbK1dYOxlj4Llvwsanq0JZOF2RUuRGXiot+BuXRNc/Kpuhe0ifEQQU1YpSuiRcFfbr
         HoZo/dpzArJoXcxAn3S+lWPdQSBoCYEEnznmOh3A5BkvmkZo103JyLpvmPCzJfzqFj3n
         dDunymlf7Jd5m6Dbgx5RrmGdCHEmVZ3whbUZxk4MbOZToMpD3nci6nOGk+lNHZNHiDOl
         EErg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@zytor.com header.s=2022090501 header.b=ri09LYJh;
       spf=pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com ([2607:7c80:54:3::138])
        by gmr-mx.google.com with ESMTPS id mp18-20020a17090b191200b0020a6948d68dsi97083pjb.1.2022.10.03.16.51.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 16:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) client-ip=2607:7c80:54:3::138;
Received: from [127.0.0.1] ([73.223.250.219])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 293NpL7D3165639
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 3 Oct 2022 16:51:22 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 293NpL7D3165639
Date: Mon, 03 Oct 2022 16:51:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Nadav Amit <namit@vmware.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>, Alexander Graf <graf@amazon.com>,
        Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        Srivatsa Bhat <srivatsab@vmware.com>,
        "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
        Alexey Makhalov <amakhalov@vmware.com>,
        Vasavi Sirnapalli <vsirnapalli@vmware.com>,
        "er.ajay.kaher@gmail.com" <er.ajay.kaher@gmail.com>,
        "willy@infradead.org" <willy@infradead.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
        "helgaas@kernel.org" <helgaas@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
User-Agent: K-9 Mail for Android
In-Reply-To: <AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com> <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com> <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com> <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com> <AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2@vmware.com>
Message-ID: <8859A371-E810-4720-AAFD-06603816AA53@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@zytor.com header.s=2022090501 header.b=ri09LYJh;       spf=pass
 (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as
 permitted sender) smtp.mailfrom=hpa@zytor.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=zytor.com
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

On October 3, 2022 2:28:40 PM PDT, Nadav Amit <namit@vmware.com> wrote:
>On Oct 3, 2022, at 2:06 PM, H. Peter Anvin <hpa@zytor.com> wrote:
>
>> =E2=9A=A0 External Email
>>=20
>> On October 3, 2022 10:34:15 AM PDT, Nadav Amit <namit@vmware.com> wrote:
>>> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrot=
e:
>>>=20
>>>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>>>> better, introducing a new global var is our 'last resort' and should b=
e
>>>> avoided whenever possible. Alternatively, you can add a
>>>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>>>> hypervisor_x86' but I'm unsure if it's better.
>>>>=20
>>>> Also, please check Alex' question/suggestion.
>>>=20
>>> Here is my take (and Ajay knows probably more than me):
>>>=20
>>> Looking briefly on MCFG, I do not see a clean way of using the ACPI tab=
le.
>>> The two options are either to use a reserved field (which who knows, mi=
ght
>>> be used one day) or some OEM ID. I am also not familiar with
>>> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about th=
at.
>>>=20
>>> Anyhow, I understand (although not relate) to the objection for a new g=
lobal
>>> variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=
=E2=80=9D and using
>>> the proper infrastructure? Calling it explicitly a bug may even push wh=
oever
>>> can to resolve it.
>>>=20
>>> IOW, how about doing something along the lines of (not tested):
>>>=20
>>>=20
>>> -- >8 --
>>>=20
>>> Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
>>>=20
>>> ---
>>> arch/x86/include/asm/cpufeatures.h | 1 +
>>> arch/x86/kernel/cpu/common.c       | 2 ++
>>> arch/x86/kernel/cpu/vmware.c       | 2 ++
>>> arch/x86/pci/common.c              | 6 ++++--
>>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/=
cpufeatures.h
>>> index ef4775c6db01..216b6f357b6d 100644
>>> --- a/arch/x86/include/asm/cpufeatures.h
>>> +++ b/arch/x86/include/asm/cpufeatures.h
>>> @@ -460,5 +460,6 @@
>>> #define X86_BUG_MMIO_UNKNOWN          X86_BUG(26) /* CPU is too old and=
 its MMIO Stale Data status is unknown */
>>> #define X86_BUG_RETBLEED              X86_BUG(27) /* CPU is affected by=
 RETBleed */
>>> #define X86_BUG_EIBRS_PBRSB           X86_BUG(28) /* EIBRS is vulnerabl=
e to Post Barrier RSB Predictions */
>>> +#define X86_BUG_ECAM_MMIO             X86_BUG(29) /* ECAM MMIO is bugg=
y and PIO is preferable */
>>>=20
>>> #endif /* _ASM_X86_CPUFEATURES_H */
>>> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.=
c
>>> index 3e508f239098..c94175fa304b 100644
>>> --- a/arch/x86/kernel/cpu/common.c
>>> +++ b/arch/x86/kernel/cpu/common.c
>>> @@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuinf=
o_x86 *c)
>>> {
>>>      u64 ia32_cap =3D x86_read_arch_cap_msr();
>>>=20
>>> +      setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
>>> +
>>>      /* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not mi=
tigated */
>>>      if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
>>>          !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
>>> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.=
c
>>> index 02039ec3597d..8903776284a6 100644
>>> --- a/arch/x86/kernel/cpu/vmware.c
>>> +++ b/arch/x86/kernel/cpu/vmware.c
>>> @@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
>>>              setup_force_cpu_cap(X86_FEATURE_VMCALL);
>>>      else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_VM=
MCALL)
>>>              setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
>>> +
>>> +      setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
>>> }
>>>=20
>>> static void __init vmware_platform_setup(void)
>>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>>> index ddb798603201..bc81cf4c1014 100644
>>> --- a/arch/x86/pci/common.c
>>> +++ b/arch/x86/pci/common.c
>>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_o=
ps;
>>> int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
>>>                                              int reg, int len, u32 *val=
)
>>> {
>>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>>              return raw_pci_ops->read(domain, bus, devfn, reg, len, val=
);
>>>      if (raw_pci_ext_ops)
>>>              return raw_pci_ext_ops->read(domain, bus, devfn, reg, len,=
 val);
>>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bu=
s, unsigned int devfn,
>>> int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>>                                              int reg, int len, u32 val)
>>> {
>>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>>              return raw_pci_ops->write(domain, bus, devfn, reg, len, va=
l);
>>>      if (raw_pci_ext_ops)
>>>              return raw_pci_ext_ops->write(domain, bus, devfn, reg, len=
, val);
>>=20
>> Also... any reason we can't just set raw_pci_ops =3D=3D raw_ext_pci_ops =
for the case when the latter is preferred, and dispense with the conditiona=
ls in the use path? Similarly, raw_ext_pci_ops could be pointed to error ro=
utines instead of left at NULL.
>
>I understood from Ajay that the initialization of raw_ext_pci_ops can be
>done after the hypervisor initialization takes place, so doing what exactl=
y
>what you proposed by is not possible. It can probably be resolved, but I d=
o
>not think the end result would be simpler or cleaner. I think that the =E2=
=80=9Cbug=E2=80=9D
>solution really conveys the behavior.
>
>IIUC performance would not be noticeable affected by 2 more conditional
>branches.
>
>

Isn't that exactly what you would want?!?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8859A371-E810-4720-AAFD-06603816AA53%40zytor.com.
