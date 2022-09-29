Return-Path: <jailhouse-dev+bncBDZ5FWPBZIMRBA6D2WMQMGQEXPCTNOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe40.google.com (mail-vs1-xe40.google.com [IPv6:2607:f8b0:4864:20::e40])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57F5EF187
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Sep 2022 11:12:37 +0200 (CEST)
Received: by mail-vs1-xe40.google.com with SMTP id m186-20020a6726c3000000b0039b2e2e040dsf143623vsm.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Sep 2022 02:12:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664442756; cv=pass;
        d=google.com; s=arc-20160816;
        b=kuwwRn8XJzi8+43GFkYfdS1GBYDLjog3pRcVu5M4Fbk+WmbqqBo9wTarPTY/uLHRzP
         VA72zIAou6U88uKrQBbg6PWPF8rmwpScrst8bPO8JkOHcFi/pbsnQijivebBmQiXWzYO
         97fr7qi6oMcWCPcApSbkpbTq2PjwhCyfTDPu5bY5Oef9N1UY8w/iJY+U5RtMCvnc8dB/
         LcNplN+fv/mrjoZkIUIKyVc7hFJYetrLsFbk5j4Hz5IQt5HXx3V0d4khkE5Ue0gGuUaM
         qPyzyNhGr9Mo3lwsS4E2pYgBR34yChGZrRTHpO2yHtd162ogI0IMI4Vf9rwLY4aVvgmo
         mWPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:reply-to:content-transfer-encoding:precedence
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vau0wFyYJrkGx05YsE6KJsv3d8oaL8HH+hJYrjOo7KY=;
        b=hxH1ABp/bx8uj8GQ3SZpY5PdTTXX/Z1NNWqNTIaI0mx8EITTanpBraoJPspOhlKqSk
         KpWjO5nQP2vOw+QhYbr2kddbh8+ludu7w9/HLwxi4tEpWjDn8nZG/7LTZJACWbo57Pdj
         KNReYrwKnw/Gql32uZxbJoj76n6bsF8Yz3OGGcqcuNYbb9qf3JDPNiD3oTq99HnUaT+B
         WJ/hXKp0LpIfOeb2+X4uN9S5FnTPkBXXLIDsg9lkudxSMRiRncG2SVciXEKBcwdIsGaW
         DJP657HyvN9rcEvNWKWv3L2ZWHpXNwP8b6CVG5Rs2+f+fElhAL5qCyv7/1SrUhVRx0Df
         wTlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=tsQ51Cjr;
       spf=pass (google.com: domain of prvs=264dbb8b0=graf@amazon.de designates 52.95.48.154 as permitted sender) smtp.mailfrom="prvs=264dbb8b0=graf@amazon.de";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:reply-to:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:precedence:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date;
        bh=Vau0wFyYJrkGx05YsE6KJsv3d8oaL8HH+hJYrjOo7KY=;
        b=U+HiayyVaCRgQ+bH3ee30C9edaE9rwlTntdqAbGP+Q9uBqGZjwvFv/C7w+oTKEul0b
         sdUdLi9PGCveCmqVcP93uA3Y8XWKsxq9csZqzJ2bpQEeZy6SY0mMIDMAKpGBeh1xXNEy
         bwBTHA7xLlTef5iKPZwIvFBJwccLOFWY0LylC09MsGkCD2pkc6QV/iEwFovHtYLn3yXE
         oEs5PZrLw1Uv4Jh99bEoMi5CWAFDgQcyXc+AsputYEpHouD8/3dsDYBa+Qy44reaELFD
         jyg0INFrniy3DZ7Zyx5YPy8THf9VKdENzTv8OWGmIMtpgY046Df5XmS2o6VK25JAWXRl
         yz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:precedence:in-reply-to:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Vau0wFyYJrkGx05YsE6KJsv3d8oaL8HH+hJYrjOo7KY=;
        b=nWK6/s+MLcs/zqO0NtJTW+zMr5Ewa9K58nLjihOjPYDKHuoDIsXk68mRsKKjmEW2wb
         Do9uhGKofGypxtEdt9IWAbvc/9uZIAliZCIh2WVkDxsRz16GxedX14Xm0ApLBkwnHl0o
         jIIomZ9Nal3o8TdeDLJxyasBSTlkaDCppXvD98+jo2yRZFHfaO1xpM0EA9IewIX2lM8d
         9s1LkMkvagHIVRl6/uVmf6/6QEloWfzpt9t9VWhmMGjDZcF/u3oBfTOYoT/jwLL5vGu/
         UXy4Yt/L5T/rguLKIzzNiWrlUgaCeTNP55wYD5NS7C0cy8LGytzHv1zGaF8+jqxGkdy9
         bECg==
X-Gm-Message-State: ACrzQf0Jt/gdSW4fEy3Lu0hT6vtRQ4JLoobr/uw5Qc2C1YgWOx1yPTbU
	HgeFcOVIXxjAIFOaQF2jfB4=
X-Google-Smtp-Source: AMsMyM6FChxOotbeaHNxL04SkcIk7VydSJCOApvvbzXTshLv62f4YQoj7LoutROsQDaB59gQuIZj4w==
X-Received: by 2002:a05:6102:2333:b0:39a:c114:3841 with SMTP id b19-20020a056102233300b0039ac1143841mr780895vsa.13.1664442756311;
        Thu, 29 Sep 2022 02:12:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:e0c9:0:b0:39a:d4f3:86d2 with SMTP id m9-20020a67e0c9000000b0039ad4f386d2ls224409vsl.5.-pod-prod-gmail;
 Thu, 29 Sep 2022 02:12:35 -0700 (PDT)
X-Received: by 2002:a67:bd0f:0:b0:398:993f:fdc5 with SMTP id y15-20020a67bd0f000000b00398993ffdc5mr815281vsq.12.1664442755368;
        Thu, 29 Sep 2022 02:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664442755; cv=none;
        d=google.com; s=arc-20160816;
        b=xz31YFQjfEj/281s1B+k46XfzWBKGx4KXMiRYw7wYWKNhaJ5icTC3aHtNN845Ic5PP
         iboX2WXXem2iiGXuxhueZFiAl8P/ZzNGODAw8GGUfrE8n9r/DJJ4aQFtC6H5wRq+iHG1
         UtJW5hFUw/Px/jpnMj4M81Du8CK7spjxYeXMMOW0SVlXehOZGCzecBNpfZFQvd3jOYEH
         1O0RqAfMqXjNYA6X/UM/TUCVsecTc20saTSqqtOYE3XIT0aj6yNTOHdD7bz7MVuX+gEb
         yN7lGW8DoM6VY5SLoZQFxvcxyxU8rKYU607ntB/thnS1zD8YaQzyLM5FqzxboKrk3sxa
         nfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:precedence:in-reply-to:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gbX7+1PHfMiTfg5A2mAeVk2kLj1W8TIaBDtUydjsZQ8=;
        b=TeF/HJPdaVwWG99TLoAUdEEnpn5FgALXS4xJfYKqj0LaE8lVUdrAZoLbgfJQ1ua6sd
         9aq9loSTE4qXyAPR0GGMfbrEoeOIp9VqEzkCS4/Ub6SkIAetv5jikIj5sqVOJFkFURXP
         L606eX5/b4svbU8o9PN2t06QLMgx/AVhYJzNOuJHInS5cZAbOTR5dRfMER9fk8qw/oev
         y3u8te9zi9uy1xruGIAG/W2kGtKtQX5wzT1d4oGDYp6AD+SnBRyFH1Dk2ARBFm5eBUY4
         dXLkj4SfUwEgh1rOEbn8nPTZimq6mqgQWmmH7QmlutiIDfRX3XdNiwYMxZ83geg2O9fR
         u6tA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=tsQ51Cjr;
       spf=pass (google.com: domain of prvs=264dbb8b0=graf@amazon.de designates 52.95.48.154 as permitted sender) smtp.mailfrom="prvs=264dbb8b0=graf@amazon.de";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com. [52.95.48.154])
        by gmr-mx.google.com with ESMTPS id w140-20020a1f9492000000b003760f8bf2a0si214787vkd.2.2022.09.29.02.12.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of prvs=264dbb8b0=graf@amazon.de designates 52.95.48.154 as permitted sender) client-ip=52.95.48.154;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-9a235a16.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 09:12:24 +0000
Received: from EX13MTAUWC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-9a235a16.us-east-1.amazon.com (Postfix) with ESMTPS id 446D78015E;
	Thu, 29 Sep 2022 09:12:18 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Thu, 29 Sep 2022 09:12:17 +0000
Received: from [10.95.64.54] (10.43.160.111) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.12; Thu, 29 Sep
 2022 09:12:11 +0000
Message-ID: <1f1beb97-2a36-dcc0-f09a-59af19663ae2@amazon.com>
Date: Thu, 29 Sep 2022 10:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Content-Language: en-US
To: Ajay Kaher <akaher@vmware.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
	<srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
	<vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
	<er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
	"Nadav Amit" <namit@vmware.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Michael S.
 Tsirkin" <mst@redhat.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
From: "'Alexander Graf' via Jailhouse" <jailhouse-dev@googlegroups.com>
In-Reply-To: <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
X-Originating-IP: [10.43.160.111]
X-ClientProxiedBy: EX13D23UWA004.ant.amazon.com (10.43.160.72) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: list
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: graf@amazon.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@amazon.com header.s=amazon201209 header.b=tsQ51Cjr;       spf=pass
 (google.com: domain of prvs=264dbb8b0=graf@amazon.de designates 52.95.48.154
 as permitted sender) smtp.mailfrom="prvs=264dbb8b0=graf@amazon.de";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
X-Original-From: Alexander Graf <graf@amazon.com>
Reply-To: Alexander Graf <graf@amazon.com>
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


On 29.09.22 07:36, Ajay Kaher wrote:
>> =EF=BB=BFOn 13/09/22, 7:05 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> =
wrote:
>>> Thanks Vitaly for your response.
>>>
>>> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority'=
 field to struct pci_raw_ops
>>> doesn't seems to be appropriate as need to take decision which object o=
f struct pci_raw_ops has
>>> to be used, not something with-in struct pci_raw_ops.
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
>>           int (*read)(unsigned int domain, unsigned int bus, unsigned in=
t devfn,
>>                                                 int reg, int len, u32 *v=
al);
>>           int (*write)(unsigned int domain, unsigned int bus, unsigned i=
nt devfn,
>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>> index ddb798603201..e9965fd11576 100644
>> --- a/arch/x86/pci/common.c
>> +++ b/arch/x86/pci/common.c
>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_op=
s;
>>   int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>                                                  int reg, int len, u32 *=
val)
>> {
>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_op=
s->rating))
>>                  return raw_pci_ops->read(domain, bus, devfn, reg, len, =
val);
>>          if (raw_pci_ext_ops)
>>                  return raw_pci_ext_ops->read(domain, bus, devfn, reg, l=
en, val);
>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus=
, unsigned int devfn,
>>   int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int =
devfn,
>>                                                  int reg, int len, u32 v=
al)
>> {
>> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_op=
s->rating))
>>                  return raw_pci_ops->write(domain, bus, devfn, reg, len,=
 val);
>>           if (raw_pci_ext_ops)
>>                  return raw_pci_ext_ops->write(domain, bus, devfn, reg, =
len, val);
>>
>> and then somewhere in Vmware hypervisor initialization code
>> (arch/x86/kernel/cpu/vmware.c) you do
>>
>>   raw_pci_ext_ops->rating =3D 100;
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
>          .read =3D         pci_mmcfg_read,
>          .write =3D        pci_mmcfg_write,
> };
>
> So to avoid this change, is it fine to have global bool prefer_raw_pci_ex=
t_ops?
>
> And raw_pci_read() will have following change:
>
> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
> +            (!prefer_raw_pci_ext_ops ||  !raw_pci_ext_ops)
>
>> why wouldn't it work?
>>
>> (diclaimer: completely untested, raw_pci_ops/raw_pci_ext_ops
>> initialization has to be checked so 'rating' is not garbage).
>>
>>> It's a generic solution for all hypervisor (sorry for earlier wrong
>>> Subject), not specific to VMware. Further looking for feedback if it's
>>> impacting to any hypervisor.
>> That's the tricky part. We can check modern hypervisor versions, but
>> what about all other versions in existence? How can we know that there's
>> no QEMU/Hyper-V/... version out there where MMIO path is broken? I'd
>> suggest we limit the change to Vmware hypervisor, other hypervisors may
>> use the same mechanism (like the one above) later (but the person
>> suggesting the patch is always responsible for the research why it is
>> safe to do so).
> Ok, as of now we will make this change specific to VMware hypervisor.


Is there a way we can make it an ACPI property in MCFG to have the=20
environment self-describe the fact that it's safe to do ECAM access for=20
config space access over legacy PIO? That way we don't need to patch=20
guests every time a hypervisor decides that it's safe to prefer ECAM.

Also, Michael (CC'ed) mentioned that according to spec, your PCIe host=20
bridge with PCI_COMMAND.MEMORY=3D0 would stop responding to its ECAM=20
window. Given that most ARM systems have no PIO fallback path, we want=20
to make sure we never hit that condition.


Alex





Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1f1beb97-2a36-dcc0-f09a-59af19663ae2%40amazon.com.
