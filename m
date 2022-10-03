Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBBQE35WMQMGQEXARS5PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9AF5F3768
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Oct 2022 23:01:54 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id g66-20020a636b45000000b0043a256d3639sf7636249pgc.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 14:01:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664830913; cv=pass;
        d=google.com; s=arc-20160816;
        b=MSRC98MXEndwX8etqMQZxyA6BVTcw9falb3vNuya5oHbDs4JuuzHpZiUuK3W8CCdBG
         qYM2zSmzDdJNyN8zJeW8biuSqJd0GrJc+EraTYA8a0HSx5zPNtgnQhnHJyoR72srBsMl
         cC7aTOuIwCBly9A1CtWUjXsDBrq6xpDG9T6lIThpfk6CcksL2/H3TTRZ200U3fWzKR4L
         5qGUA6Rqwp+fIo7JCIBCyVD2vhkOCMdo5CVeR+XLZDoVjJKQX6v/PV0LvUCTkJv5BLZ6
         14kvBXrocqOQqEhCLSeIcH2QTVhk0FyJr4GhwahwHmVm/n1YqMVROvH2y4IkoR8t4Q6h
         AvDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:user-agent:subject
         :cc:to:from:date:dkim-filter:sender:dkim-signature;
        bh=FTOhDPU7beUvt6/tCRjJ/cwSHzvlQlgLYNwNAAdXlK8=;
        b=NDOW/CDEER+T1BJ+S4kvY51zJPmEwfIEC2tWsokQw2+rZnjAssnTinAIBtoTcvaO2E
         L9KrMA7Xn5xGKcYLomVYL4uA4RwH4/HM3fZVvJeLZngIVOJGkSOjxdJz1C2MOH7Izppq
         hkdSCvjdd/sJTudqEG+GhgRgjAvv8SPMicWi3y7FImzjg17DG+b8dB6FuT+qyqPxy4/J
         /qiSiCcxQp+fi7zxTPIdgjrEbieP3Azk5/9LyyYMyk4dtZlKVwDP+3erBRwWqyQIQfRP
         0o2PnKuNsmzXmPZD1Il3WlPzT0lz28zpQedGkAxXtGtQP04NOCSjJgzfAXw++2bbbn3J
         tiDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@zytor.com header.s=2022090501 header.b=oykLJvyx;
       spf=pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date
         :dkim-filter:sender:from:to:cc:subject:date;
        bh=FTOhDPU7beUvt6/tCRjJ/cwSHzvlQlgLYNwNAAdXlK8=;
        b=fYjacSgopCi8KWdlvzVsL/oOW4X7IkW4Rx34TsYQgf3ia5QYw2aMloq1abTF4rlLJn
         /UdW/SVnX/ErtPVmsOnvtQgW8MeussqnfWL+WopfR3a+sTbenaaVpBZcY1ksFfnZIG/M
         +xmBp9a4LF1tUp4B7K4tdaQLOmbhWMYVlEvKRU4YahDMo4OSuBfZrXzv9KMrsVP7a+LV
         hJZNmj8yFjsSPhibxlOR2G5igyZp8F8TXkDMi/Iey/1w9h8BIA8Tn0iwnkk8X07fugqz
         UkEdCZ1tsIjlxGvFiX83Su5DsaVXaYSMQjQhHvuX8e2/xvXBVZvMzECeGUsZuYwVo8mt
         1e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-filter
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=FTOhDPU7beUvt6/tCRjJ/cwSHzvlQlgLYNwNAAdXlK8=;
        b=PZqILTuLh4x2hmeaSammxqWg19vRVQ6HokXoeRwbHNBpJHLTP+xAo2ErOII5DweLbK
         kjGJSGOAJ7RVIqtNAXA/hh/IkVghnhL++RsDA6OY5mvT1NRs/n471ZzCoR8Dqi8XC+m+
         jxmfAvuFbIShW3bPlQ1wVRFHEiAohLHqfwmv2TJ5BFqDPlZEbX38sZgEWGIBDSK7lW5W
         ziwpzQz9v/ZnOC5flKMomLNJMdoXW8SDH5QD7iRDlpyO1E03/OKAEkhWnSpoMWG8k5Mr
         5ioc0W0yBnXfLEsnxb7sYxPsrZgiGJJgOSwMTl82o+2FfkFSwMwJUHIJajx5zNp4alEf
         W6kQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1xy3pzbQeOYnugzZ+ocayySlm8kuGxPnSWR4Vc/RaWhadgTu7H
	ZyMxGu33MLcih36IP8GqJU0=
X-Google-Smtp-Source: AMsMyM7KzInvUOjRmvDrDmhgMyc1bgW5487Jj4lI01vKnNBXdCIe/e17wxJwINuxzu92OrlZvXIctg==
X-Received: by 2002:a05:6a00:1342:b0:545:4d30:eecb with SMTP id k2-20020a056a00134200b005454d30eecbmr23829520pfu.69.1664830913212;
        Mon, 03 Oct 2022 14:01:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:903:2d1:b0:16e:ce7d:3e1e with SMTP id
 s17-20020a17090302d100b0016ece7d3e1els10392493plk.1.-pod-prod-gmail; Mon, 03
 Oct 2022 14:01:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4d2:b0:17a:a33:e334 with SMTP id o18-20020a170902d4d200b0017a0a33e334mr23881710plg.17.1664830911786;
        Mon, 03 Oct 2022 14:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664830911; cv=none;
        d=google.com; s=arc-20160816;
        b=nJZD0kv78nNAAkBVW+w60QFnAEoR59yz6rMj65APhTVYQVCPznEZ75Wlo+N/kQcm5e
         i0qJ4Pu+lv2koIEawzy99f0uS8kdB1M5mX64M/ySsr6B+zCiJ0aquQ+CW0kH3nzOXWfZ
         6PYOToiAiExugeEsTn2FWSk7lgvOXgoGqt55K1Na8YAYZP73Q6ysqNH//4pixXOYFsJv
         t8ZpA9DO1UUomm5RYeI+VWG+jlNdMxjzgJJOC39ggMKNAyORQogvPftyPj6OxVfZWFKr
         9j/EuxLh9HFbV7cb2x4eV/jgaByDxXj9itklLDoq00lsvpcGMOoQlGmLfsYAkKmD787S
         Dh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature
         :dkim-filter;
        bh=5zHAz69mkxip2bzOLRJ4yt3No7BYKjAs2m4UMY86+jU=;
        b=0FyXDtOTfkgc70dSyL58Wh60yEBQEtdBy5kp6klixX/9cQz7LG+3WaF7EcaeDCyyLo
         kcTIe5pAD9BX191njNK85+ejaUimF6YLIBDj07dNogIqUdzTJAEXIplWM8nFiz9FYSQF
         WDXNJ7FknWIlXiJbD+ptHMrgMxAt31iQ2z4sF9A1UZDBkm9RkKfqEiLmURl1dQPv4SIB
         FC7ZAZCJBg7TaokZCtRYBN/lbB2QCG4gsmR45MW4B52ZZH5gPHPMn2z74v9gvNRycyI1
         vo0TjDSCf6Mmewbtqog0WvkmmRTTJrosVtLmAeJRNih31LKCYgUfd9CpSItviDiRjwHh
         z31A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@zytor.com header.s=2022090501 header.b=oykLJvyx;
       spf=pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com ([2607:7c80:54:3::138])
        by gmr-mx.google.com with ESMTPS id z1-20020a63b041000000b00423291dc756si471743pgo.5.2022.10.03.14.01.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 14:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) client-ip=2607:7c80:54:3::138;
Received: from [127.0.0.1] ([73.223.250.219])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 293L1MEs3109337
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 3 Oct 2022 14:01:22 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 293L1MEs3109337
Date: Mon, 03 Oct 2022 14:01:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Ajay Kaher <akaher@vmware.com>
CC: "x86@kernel.org" <x86@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        Srivatsa Bhat <srivatsab@vmware.com>,
        "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
        Alexey Makhalov <amakhalov@vmware.com>,
        Vasavi Sirnapalli <vsirnapalli@vmware.com>,
        "er.ajay.kaher@gmail.com" <er.ajay.kaher@gmail.com>,
        "willy@infradead.org" <willy@infradead.org>,
        Nadav Amit <namit@vmware.com>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
        "helgaas@kernel.org" <helgaas@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
User-Agent: K-9 Mail for Android
In-Reply-To: <87tu4l9cfm.fsf@redhat.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com> <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com> <87tu4l9cfm.fsf@redhat.com>
Message-ID: <E522EECC-D20D-4A69-8A44-9CF2B36E2A29@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@zytor.com header.s=2022090501 header.b=oykLJvyx;       spf=pass
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

On October 3, 2022 8:03:41 AM PDT, Vitaly Kuznetsov <vkuznets@redhat.com> w=
rote:
>Ajay Kaher <akaher@vmware.com> writes:
>
>>> =EF=BB=BFOn 13/09/22, 7:05 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com>=
 wrote:
>>>>
>>>> Thanks Vitaly for your response.
>>>>
>>>> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority=
' field to struct pci_raw_ops
>>>> doesn't seems to be appropriate as need to take decision which object =
of struct pci_raw_ops has
>>>> to be used, not something with-in struct pci_raw_ops.
>>>
>>> I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
>>> which are called 'raw_pci_ops' and 'raw_pci_ext_ops'. What if you do
>>> something like (completely untested):
>>>
>>> diff --git a/arch/x86/include/asm/pci_x86.h b/arch/x86/include/asm/pci_=
x86.h
>>> index 70533fdcbf02..fb8270fa6c78 100644
>>> --- a/arch/x86/include/asm/pci_x86.h
>>> +++ b/arch/x86/include/asm/pci_x86.h
>>> @@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev *=
dev);
>>> extern bool mp_should_keep_irq(struct device *dev);
>>>
>>> struct pci_raw_ops {
>>> +       int rating;
>>>          int (*read)(unsigned int domain, unsigned int bus, unsigned in=
t devfn,
>>>                                                int reg, int len, u32 *v=
al);
>>>          int (*write)(unsigned int domain, unsigned int bus, unsigned i=
nt devfn,
>>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>>> index ddb798603201..e9965fd11576 100644
>>> --- a/arch/x86/pci/common.c
>>> +++ b/arch/x86/pci/common.c
>>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_o=
ps;
>>>  int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>>                                                 int reg, int len, u32 *=
val)
>>> {
>>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_o=
ps->rating))
>>>                 return raw_pci_ops->read(domain, bus, devfn, reg, len, =
val);
>>>         if (raw_pci_ext_ops)
>>>                 return raw_pci_ext_ops->read(domain, bus, devfn, reg, l=
en, val);
>>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bu=
s, unsigned int devfn,
>>>  int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int =
devfn,
>>>                                                 int reg, int len, u32 v=
al)
>>> {
>>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_o=
ps->rating))
>>>                 return raw_pci_ops->write(domain, bus, devfn, reg, len,=
 val);
>>>          if (raw_pci_ext_ops)
>>>                 return raw_pci_ext_ops->write(domain, bus, devfn, reg, =
len, val);
>>>
>>> and then somewhere in Vmware hypervisor initialization code
>>> (arch/x86/kernel/cpu/vmware.c) you do
>>>
>>>  raw_pci_ext_ops->rating =3D 100;
>>
>> Thanks Vitaly, for your review and helping us to improve the code.
>>
>> I was working to make changes as you suggested, but before sending v3 wo=
uld like to
>> discuss on following:
>>
>> If we add rating with-in struct pci_raw_ops then we can't have pci_mmcfg=
 as const,
>> and following change is must in arch/x86/pci/mmconfig_64.c:
>>
>> -const struct pci_raw_ops pci_mmcfg =3D {
>> +struct pci_raw_ops pci_mmcfg =3D {
>>  	.read =3D		pci_mmcfg_read,
>>  	.write =3D	pci_mmcfg_write,
>> };
>>
>> So to avoid this change, is it fine to have global bool prefer_raw_pci_e=
xt_ops?
>>
>> And raw_pci_read() will have following change:
>>
>> -	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +	     (!prefer_raw_pci_ext_ops ||  !raw_pci_ext_ops)
>>
>
>Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>better, introducing a new global var is our 'last resort' and should be
>avoided whenever possible. Alternatively, you can add a
>raw_pci_ext_ops_preferred() function checking somethin within 'struct
>hypervisor_x86' but I'm unsure if it's better.
>
>Also, please check Alex' question/suggestion.
>
>...
>

Could this be ro_after_init?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E522EECC-D20D-4A69-8A44-9CF2B36E2A29%40zytor.com.
