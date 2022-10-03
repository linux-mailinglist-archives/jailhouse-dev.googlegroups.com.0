Return-Path: <jailhouse-dev+bncBCZNXZV44IJBBVXT5OMQMGQEHH3E6II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x939.google.com (mail-ua1-x939.google.com [IPv6:2607:f8b0:4864:20::939])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD35F3245
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Oct 2022 17:03:51 +0200 (CEST)
Received: by mail-ua1-x939.google.com with SMTP id e20-20020ab031d4000000b003bef9338964sf4251065uan.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 08:03:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664809430; cv=pass;
        d=google.com; s=arc-20160816;
        b=v83TjKA99VVORDhQAjEJLD2HFeauMXVU3FuNxBFA6HlFZSttrGa+Z0o24BUQCnsD/N
         mUHhkrMVvhsgmcf8f7lagNgdfr2FA6H2I+KF2Nq9XoH06mLQFu3dhx6qvn6LvcI7apCQ
         ATogspcPjTuldTSZXlY3snzC2HrYsLJmiOuPTh7RIinTylFVYSu03kw0PIndk6bNYTJI
         QO5MTH/pRbeBzannx5bdXgKoSHNBy/9QUwKjdD0Cc5y4kAbvLm5gZr+179ntXmVfFWCg
         hvrugKjR/q+EfXtzj6CItWunsV/Ph+HLg0lTZCHbMHWXF3z9J8pAoKO7nKBMJUwwb+Nm
         bfYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:sender:dkim-signature;
        bh=qJwMc/rh/gjsYsojH94MB5j3sQirTj5K4RWfwupNHf4=;
        b=hMkjsU1jovfEw4mCORqhiCFwXK6qSgJGqu0sKBHpyezcXvkE6Q0VPcl6vghXeU+PxV
         TH8pJv8bO62ZnKrxkbpnYnCZqoqBJbe89PoHQsBsdpOMUV4LBcOt2XXly3N6/Kb4RoR9
         WoVfMu3h3yU18hXvABhByVvaiOtC+/jx8AwtfpBholcGoN6+j0nLgcIJ0M10paXcvLpb
         0BMv7Rt+pcVjMolkS34DntZbvdvTvSDqL0yl9Wpeh0vEmb1qiaQQbvkkWI2U9UllNWgF
         GQATMLd29DHNpnCPAOOClxypqBqiXHfkMoSCrJHWZifHQcKV3wD6gV68slUhzREaRgk2
         K9/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eWZbWw1Z;
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :date:references:in-reply-to:subject:cc:to:from:sender:from:to:cc
         :subject:date;
        bh=qJwMc/rh/gjsYsojH94MB5j3sQirTj5K4RWfwupNHf4=;
        b=rvUNvZ74jjR3v8EHTMWUjCoNpG9iSZxxS3wqsnDY6mnr8Td8y/MZvI6pvPSD+rsHIv
         SSs1ts9RKZut+XE9iq/KBtXpKIj07rDLcgBflcoOHYyVMCesPu0f70f+BzPhuIM1GnEw
         2iVcSi75HBDRzHdlzxAGA7vDf+bvtMuZRub0Iper83HgP5ZZqIxtfhVlR8c9vDEsG23C
         dpZlslTEtwCxfVy8ZJRvi6T2zUJKyH2aehdPJK2fkoTXrYKwzC5hHVQCZ4aFqAOEml+Z
         aM2XZJRjBcr91Hn5oP2FhL6jeiGiJYrB21dKLA4lidLNX3/NQuEXyG/Dx1HP2j+n/xEr
         4tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=qJwMc/rh/gjsYsojH94MB5j3sQirTj5K4RWfwupNHf4=;
        b=WeCwJ/ZJTShyeDbvspICBxFMrB8d2mw3Y03x8NkebIf91fTfhNsg0PPyv6mq/56M6+
         LxofPfc32eU0lV2Cb1m6307XV0SGh9rDrsVFGuoHmaao0eCcTWA1+IxNaQoq1Yi7M0qj
         cbfxREFyGg4YH/V3PH3rGfCgNJR4Lz+YeQJB00l6FtD20AmL5r6C9myPfcVhIFWPqI4z
         HFjBJ8ioGtIBVHQkeuOnsc3ZFbNnkbbv4w9/H9C65PxphU6eYNZI1P/2j9zmE5WQy3q1
         qZTMWu0iyKVGQdKhrrOvX0K4p+rps2Z/wNEwKmcHgaOIomIaBqK1oKnr9n9PqxbkB2eT
         NGFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2Ro88+PIgoLEeciz/CDGl/Mc6uhmg1RaFWPNx2Ujev/ZvlJN6w
	6rVH3OaL8xSDkeVLg2bd2qc=
X-Google-Smtp-Source: AMsMyM5jpXkV7zEmP3zV7wu457bUXCvgDR2J7cjUFvOzaml2G55cPlSvlLTRdpcn40Cm/Nzm70vw2Q==
X-Received: by 2002:a1f:9116:0:b0:3a2:362b:fea9 with SMTP id t22-20020a1f9116000000b003a2362bfea9mr8969881vkd.11.1664809430695;
        Mon, 03 Oct 2022 08:03:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:4926:0:b0:3b3:6d5a:e75d with SMTP id z35-20020ab04926000000b003b36d5ae75dls833116uac.10.-pod-prod-gmail;
 Mon, 03 Oct 2022 08:03:49 -0700 (PDT)
X-Received: by 2002:ab0:136d:0:b0:3b3:da15:c7de with SMTP id h42-20020ab0136d000000b003b3da15c7demr10128648uae.25.1664809429528;
        Mon, 03 Oct 2022 08:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664809429; cv=none;
        d=google.com; s=arc-20160816;
        b=c0f3CM6Rx+Pxnvy/Z4flQh+Qy1fBRkh5uFpwlD9V8J4L45YhINdzY0C4YjtqICbJrW
         82itFazqEtmQsckknl4oASP0tGvlbImN8GiyRDYiF2dMwxPfYd0CXUOoVWQ93idzEYkN
         1mDR6ABFtDTitYwE774JOZDRHiqrDBloTmmTJCcxByMqg68ZgHbbxoKR5DaV0MgfSWqy
         q/mUQsenh+xioY6icKfV1brlOxkefpxj2gSQgXalEMgkHZiOAc9sFJjDF2mycmRgSk01
         G4JC6e0A2qj2Gj7EI5ur33yjCq1KSMwsFcDvfdbWqFt8xjj0dx14WAJoHwyD0u+D9K8Q
         iJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Jcy8kZYpXeDbLsYPjZ2qO+Lh7p/Rgt7Xact/w0g7X3E=;
        b=PiZ/1K5WQefZvGQG3HGJ0TX/0vNjV+pFHLm4VkQ0qYdWRNNP4EHlZfc87dOI7MgsNp
         USWy4wtqVfTmtRkDZuU5fChn+Y4Q9h2Y02fFidieaJcDlhRKrWx0tkMxu8v9arcejaqW
         7f/93Y+5s4zXn1cDrzwz3rnAgs4r3lWBRtJxPvFKAT9mE3wqeICln8kT2ZIUXnNWyicH
         8/giOWwQJUU4ZaV43CeTIRK88M07n3eoiwCLuRdqzUtRIPU8mSk/xWSXBwvUiJ45dZ9J
         6JWe6LkDdzj+GtbgoFC49E4F3U3GQH248U29+trnVDQizbjH1R0nIEaR8TnkGlxuOnh2
         HrpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eWZbWw1Z;
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by gmr-mx.google.com with ESMTPS id g184-20020a1f9dc1000000b003a4a4b2a98dsi419980vke.3.2022.10.03.08.03.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 08:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of vkuznets@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-K2iOVc0dPImqzFcb5oTedw-1; Mon, 03 Oct 2022 11:03:48 -0400
X-MC-Unique: K2iOVc0dPImqzFcb5oTedw-1
Received: by mail-wm1-f70.google.com with SMTP id k21-20020a7bc415000000b003b4fac53006so2987891wmi.3
        for <jailhouse-dev@googlegroups.com>; Mon, 03 Oct 2022 08:03:44 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3b4:c8ce:be87 with SMTP id f11-20020a05600c4e8b00b003b4c8cebe87mr7593507wmq.157.1664809423569;
        Mon, 03 Oct 2022 08:03:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3b4:c8ce:be87 with SMTP id f11-20020a05600c4e8b00b003b4c8cebe87mr7593479wmq.157.1664809423275;
        Mon, 03 Oct 2022 08:03:43 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b003a84375d0d1sm17657403wmq.44.2022.10.03.08.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 08:03:42 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ajay Kaher <akaher@vmware.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
 <srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
 <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
 Nadav Amit <namit@vmware.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "jailhouse-dev@googlegroups.com"
 <jailhouse-dev@googlegroups.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "acrn-dev@lists.projectacrn.org"
 <acrn-dev@lists.projectacrn.org>, "helgaas@kernel.org"
 <helgaas@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
 <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Alexander
 Graf <graf@amazon.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
In-Reply-To: <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
 <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
Date: Mon, 03 Oct 2022 17:03:41 +0200
Message-ID: <87tu4l9cfm.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: vkuznets@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=eWZbWw1Z;
       spf=pass (google.com: domain of vkuznets@redhat.com designates
 170.10.133.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
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

Ajay Kaher <akaher@vmware.com> writes:

>> =EF=BB=BFOn 13/09/22, 7:05 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> =
wrote:
>>>
>>> Thanks Vitaly for your response.
>>>
>>> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority'=
 field to struct pci_raw_ops
>>> doesn't seems to be appropriate as need to take decision which object o=
f struct pci_raw_ops has
>>> to be used, not something with-in struct pci_raw_ops.
>>
>> I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
>> which are called 'raw_pci_ops' and 'raw_pci_ext_ops'. What if you do
>> something like (completely untested):
>>
>> diff --git a/arch/x86/include/asm/pci_x86.h b/arch/x86/include/asm/pci_x=
86.h
>> index 70533fdcbf02..fb8270fa6c78 100644
>> --- a/arch/x86/include/asm/pci_x86.h
>> +++ b/arch/x86/include/asm/pci_x86.h
>> @@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev *d=
ev);
>> extern bool mp_should_keep_irq(struct device *dev);
>>
>> struct pci_raw_ops {
>> +       int rating;
>>          int (*read)(unsigned int domain, unsigned int bus, unsigned int=
 devfn,
>>                                                int reg, int len, u32 *va=
l);
>>          int (*write)(unsigned int domain, unsigned int bus, unsigned in=
t devfn,
>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>> index ddb798603201..e9965fd11576 100644
>> --- a/arch/x86/pci/common.c
>> +++ b/arch/x86/pci/common.c
>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_op=
s;
>>  int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
>>                                                 int reg, int len, u32 *v=
al)
>> {
>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_op=
s->rating))
>>                 return raw_pci_ops->read(domain, bus, devfn, reg, len, v=
al);
>>         if (raw_pci_ext_ops)
>>                 return raw_pci_ext_ops->read(domain, bus, devfn, reg, le=
n, val);
>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus=
, unsigned int devfn,
>>  int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>                                                 int reg, int len, u32 va=
l)
>> {
>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_op=
s->rating))
>>                 return raw_pci_ops->write(domain, bus, devfn, reg, len, =
val);
>>          if (raw_pci_ext_ops)
>>                 return raw_pci_ext_ops->write(domain, bus, devfn, reg, l=
en, val);
>>
>> and then somewhere in Vmware hypervisor initialization code
>> (arch/x86/kernel/cpu/vmware.c) you do
>>
>>  raw_pci_ext_ops->rating =3D 100;
>
> Thanks Vitaly, for your review and helping us to improve the code.
>
> I was working to make changes as you suggested, but before sending v3 wou=
ld like to
> discuss on following:
>
> If we add rating with-in struct pci_raw_ops then we can't have pci_mmcfg =
as const,
> and following change is must in arch/x86/pci/mmconfig_64.c:
>
> -const struct pci_raw_ops pci_mmcfg =3D {
> +struct pci_raw_ops pci_mmcfg =3D {
>  	.read =3D		pci_mmcfg_read,
>  	.write =3D	pci_mmcfg_write,
> };
>
> So to avoid this change, is it fine to have global bool prefer_raw_pci_ex=
t_ops?
>
> And raw_pci_read() will have following change:
>
> -	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
> +	     (!prefer_raw_pci_ext_ops ||  !raw_pci_ext_ops)
>

Not my but rather PCI maintainer's call but IMHO dropping 'const' is
better, introducing a new global var is our 'last resort' and should be
avoided whenever possible. Alternatively, you can add a
raw_pci_ext_ops_preferred() function checking somethin within 'struct
hypervisor_x86' but I'm unsure if it's better.

Also, please check Alex' question/suggestion.

...

--=20
Vitaly

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/87tu4l9cfm.fsf%40redhat.com.
