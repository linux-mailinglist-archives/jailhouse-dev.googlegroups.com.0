Return-Path: <jailhouse-dev+bncBCZNXZV44IJBBAEOQKMQMGQETLFTGFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe38.google.com (mail-vs1-xe38.google.com [IPv6:2607:f8b0:4864:20::e38])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A45B6E6D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Sep 2022 15:34:58 +0200 (CEST)
Received: by mail-vs1-xe38.google.com with SMTP id a6-20020a671a06000000b003986a4e277dsf967459vsa.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Sep 2022 06:34:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663076096; cv=pass;
        d=google.com; s=arc-20160816;
        b=hCSErUFeAOyoRVT+3Z78yAUCPj6BqHb2dBOlIjdQEtaqfMeBPrwssuyNRoNfVjsynn
         NvqlME/P83c/TqlKyxpIaT+ezcOS2frcT4XdBs3OLbehIUQCM9Ysg3OxU32QaujvZqqq
         m9Ax4bh7izqIsVdY9PhJpQtxK0U8LJVnfgjZsBQdezr9eGzxVhkyOfmpg7smO2x4YMh5
         yEKcIEBnwrLXpgqlljM9R8riqwG9TWlv1+R/ahGiQVVhFTQjqQ7xjyZ58QqeRj1BUd44
         58oW2udvloryqCbNbJLB1VB4LpBCpnzvOzdWhkCdf08x2PwKcOUtpVQnyG4Stpc4Zp+U
         VGsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:sender:dkim-signature;
        bh=qzmhkDnL5vWXrYE3G4nI2TzRmieQlK8J6D7U3Oy+ETw=;
        b=IOAYOM364/Xz3Bay2gdlBsSmhPfhoQMnBlfs73SH5xZGdOyasXzqERrtMbiUKJgO9S
         IbCJw2MNkTKrEVBztwko0B1QxhuMrPwmjpzvDCxmrmYXsVzC4Bs0sFsKUqMHlry3TcwQ
         kx2+Z9HKX4S7D/hDjYmS040pxqICFdsiLStvOJutCtadidzIeIY14GyNiQrRYUMpJVhW
         NR1mwM3XiWcGDRP4kj6DDTwIipR513rIrMFwkN/RgbkycAHmhTZD0M+7QfAEbpyKKhxh
         MuWsisCsFUBmiZOkPhNXl6rQFoMf8WMXdcEUhG3K5ksY9BdFUQL0jpTj3xs6BfFT8+vf
         vCNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="M/IfkqAS";
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :date:references:in-reply-to:subject:cc:to:from:sender:from:to:cc
         :subject:date;
        bh=qzmhkDnL5vWXrYE3G4nI2TzRmieQlK8J6D7U3Oy+ETw=;
        b=T/xNvPUAK+dlThtiB6+79KqUWBUtCxhZGIUN5yu2tVC7MJZVbbpEuzSfcG7R5SZQvz
         E5mZoVJcUeSRTfsHpJ+Soh6fvOp1q6/Jm6BAMsk4PHR9NOGKDOMRbFMvChi97Iv1qvmL
         h/QCu2ypouPXPKFtntP9aBMAjrfsucLVJX+eIq3m2xZpOtY0D9v0m1vtjL2zwcfqeaAg
         8tEQC3/jjAgaesDWkwme4gpCSl9rgx6NggZ1x/JvKZg/BnWuTkgd91HAYgYbjZfHd0f5
         ZvDOAKLbjhFV1c8WIhZ5XHeVbjOJpz9Au0lHgE/DMhA1aAiCnI8MyYl6OlSKTrHMxjry
         PiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=qzmhkDnL5vWXrYE3G4nI2TzRmieQlK8J6D7U3Oy+ETw=;
        b=xEWmz3epLXxgaFX2BkXQxCA058blXPNhFbg+XT0wCSwat3rduyipwKhd1n021dX5QG
         CcvNAKuWVX0s8s/IPnnu4sIS5p4bxEa+bJ3J5mEbTKwy6b1m0eZRVoXgVIf+kz/2KM4u
         RBjOzQekqYlKzQRqIZuyqEK3/LvvvqZz7Is4W+ETSxS8nrXrZcmt6fqBOES55LL08Cqj
         +O2ftea7HzRk2cvqm13l7ZqKoNZh3FnY/FBTS2IyKzX0ta+tQBhftKj1NRm5GFUx4G3q
         L/yxwRewfhIYxeZK9sg2X6QNgVGoZsnnQlpjVs3is7m63yLdnY+5CWIO2GTyRly9AvC4
         Mikg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo2j7Zus1jSZMFaM6RWHd2dWVhJf5JK0/a6q6VuE31OPsea34TEF
	97e8JbW+sU7oXtXpVHmDMQg=
X-Google-Smtp-Source: AA6agR48m131wzk/LevUu1ApJJTDvu2tF1u0HZE8irvv0+Ze5UV+kS1aWQJNn3IwQvtKVrKXhBzGpA==
X-Received: by 2002:ab0:5b01:0:b0:39f:50e3:ea0a with SMTP id u1-20020ab05b01000000b0039f50e3ea0amr10427196uae.48.1663076096743;
        Tue, 13 Sep 2022 06:34:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:7cc7:0:b0:38c:bad9:12a9 with SMTP id x190-20020a1f7cc7000000b0038cbad912a9ls1201265vkc.11.-pod-prod-gmail;
 Tue, 13 Sep 2022 06:34:55 -0700 (PDT)
X-Received: by 2002:a05:6122:e13:b0:39e:e508:1a2e with SMTP id bk19-20020a0561220e1300b0039ee5081a2emr9361169vkb.11.1663076095772;
        Tue, 13 Sep 2022 06:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663076095; cv=none;
        d=google.com; s=arc-20160816;
        b=H6SETB1vE7zs/C24E+d6QWN3MnMt9agHcOxVjAUFlb3OEzD3ACnNmxiyytGTQJQ3kN
         M+fTPqgX0eMHlwvMab/NvrZS2wbnLy/yAKwjB7L8GrQCo5tt3Z/YsWoYANT0RW/RaDmE
         +pHcq++Sp7FdZmKkl8Z76l5IOybXD+OpdfjW/wHWhnwK0Md/EyhlRkQOafM0a+Xt8tcq
         5uw9F/RA7+9SbsKnrlxw1RZ4aENo9L/o2auUMExitFZa6ALdjFtDCnAivbaprQoy0xHU
         1dodVF74QYCpmhWBhE9nwt1QL3VIuwZNoFeDytYqR2UfAxJl7XF7qtvoaFb7m0bT7h3V
         V9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=s3xh4EumEIvumafJwct5+WCk+ZsG9qjAIuO2sjxjanY=;
        b=VXGQJeg8pWL7fId/o5+dB7Wp797RC8yTow9KSaPAoK1qeoPNXRNxIqbZakrij/YxMk
         XiErn+3IGE2YPS2hgbMvm6sugh/OTGSYLbxqdfy1fiRYkXv5n2NnOgb3/woO5Thlpjh2
         SLovQlLUECuCu6d/P+l1Ct7GHbM5QQ3i3sLgdlxEjroPLPrUv3ppeOagzS6nSVd9jupf
         u7ipmygazXlXAacE6lRbqWRje/yi7RPEE/HH11046AuaewHIJmTy/7AZwMn9R5KbGNp4
         U4LFNCPu/RteMmfhNF3IOg6vhmlFkTDK7Sy/h9PNWnbgnRCNvttwwQaKazHBha24ZQIq
         0ngQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="M/IfkqAS";
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by gmr-mx.google.com with ESMTPS id ay6-20020a056130030600b003b38a9f6c6dsi896961uab.2.2022.09.13.06.34.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 06:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of vkuznets@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-s6vAIv05Nkm3Xs5zCG93Mg-1; Tue, 13 Sep 2022 09:34:54 -0400
X-MC-Unique: s6vAIv05Nkm3Xs5zCG93Mg-1
Received: by mail-ej1-f70.google.com with SMTP id hr12-20020a1709073f8c00b0077e8371f847so2347955ejc.20
        for <jailhouse-dev@googlegroups.com>; Tue, 13 Sep 2022 06:34:54 -0700 (PDT)
X-Received: by 2002:a17:907:7f91:b0:77f:c4c7:9155 with SMTP id qk17-20020a1709077f9100b0077fc4c79155mr3137435ejc.476.1663076093159;
        Tue, 13 Sep 2022 06:34:53 -0700 (PDT)
X-Received: by 2002:a17:907:7f91:b0:77f:c4c7:9155 with SMTP id qk17-20020a1709077f9100b0077fc4c79155mr3137408ejc.476.1663076092870;
        Tue, 13 Sep 2022 06:34:52 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906218100b00730b61d8a5esm6099500eju.61.2022.09.13.06.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:34:51 -0700 (PDT)
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
In-Reply-To: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
Date: Tue, 13 Sep 2022 15:34:50 +0200
Message-ID: <87zgf3pfd1.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: vkuznets@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b="M/IfkqAS";
       spf=pass (google.com: domain of vkuznets@redhat.com designates
 170.10.129.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
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

> Note: Corrected the Subject.
>
>> =EF=BB=BFOn 07/09/22, 8:50 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> =
wrote:
>>
>>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>>> index ddb7986..1e5a8f7 100644
>>> --- a/arch/x86/pci/common.c
>>> +++ b/arch/x86/pci/common.c
>>> @@ -20,6 +20,7 @@
>>>  #include <asm/pci_x86.h>
>>>  #include <asm/setup.h>
>>>  #include <asm/irqdomain.h>
>>> +#include <asm/hypervisor.h>
>>>
>>>  unsigned int pci_probe =3D PCI_PROBE_BIOS | PCI_PROBE_CONF1 | PCI_PROB=
E_CONF2 |
>>>                               PCI_PROBE_MMCONF;
>>> @@ -57,14 +58,58 @@ int raw_pci_write(unsigned int domain, unsigned int=
 bus, unsigned int devfn,
>>>       return -EINVAL;
>>>  }
>>>
>>> +#ifdef CONFIG_HYPERVISOR_GUEST
>>> +static int vm_raw_pci_read(unsigned int domain, unsigned int bus, unsi=
gned int devfn,
>>> +                                             int reg, int len, u32 *va=
l)
>>> +{
>>> +     if (raw_pci_ext_ops)
>>> +             return raw_pci_ext_ops->read(domain, bus, devfn, reg, len=
, val);
>>> +     if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +             return raw_pci_ops->read(domain, bus, devfn, reg, len, va=
l);
>>> +     return -EINVAL;
>>> +}
>>> +
>>> +static int vm_raw_pci_write(unsigned int domain, unsigned int bus, uns=
igned int devfn,
>>> +                                             int reg, int len, u32 val=
)
>>> +{
>>> +     if (raw_pci_ext_ops)
>>> +             return raw_pci_ext_ops->write(domain, bus, devfn, reg, le=
n, val);
>>> +     if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +             return raw_pci_ops->write(domain, bus, devfn, reg, len, v=
al);
>>> +     return -EINVAL;
>>> +}
>>
>> These look exactly like raw_pci_read()/raw_pci_write() but with inverted
>> priority. We could've added a parameter but to be more flexible, I'd
>> suggest we add a 'priority' field to 'struct pci_raw_ops' and make
>> raw_pci_read()/raw_pci_write() check it before deciding what to use
>> first. To be on the safe side, you can leave raw_pci_ops's priority
>> higher than raw_pci_ext_ops's by default and only tweak it in
>> arch/x86/kernel/cpu/vmware.c
>
> Thanks Vitaly for your response.
>
> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority' f=
ield to struct pci_raw_ops
> doesn't seems to be appropriate as need to take decision which object of =
struct pci_raw_ops has
> to be used, not something with-in struct pci_raw_ops.

I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
which are called 'raw_pci_ops' and 'raw_pci_ext_ops'. What if you do
something like (completely untested):

diff --git a/arch/x86/include/asm/pci_x86.h b/arch/x86/include/asm/pci_x86.=
h
index 70533fdcbf02..fb8270fa6c78 100644
--- a/arch/x86/include/asm/pci_x86.h
+++ b/arch/x86/include/asm/pci_x86.h
@@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev *dev)=
;
 extern bool mp_should_keep_irq(struct device *dev);
=20
 struct pci_raw_ops {
+       int rating;
        int (*read)(unsigned int domain, unsigned int bus, unsigned int dev=
fn,
                                                int reg, int len, u32 *val)=
;
        int (*write)(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index ddb798603201..e9965fd11576 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_ops;
 int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn=
,
                                                int reg, int len, u32 *val)
 {
-       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_ops->=
rating))
                return raw_pci_ops->read(domain, bus, devfn, reg, len, val)=
;
        if (raw_pci_ext_ops)
                return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, =
val);
@@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus, u=
nsigned int devfn,
 int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devf=
n,
                                                int reg, int len, u32 val)
 {
-       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_ops->=
rating))
                return raw_pci_ops->write(domain, bus, devfn, reg, len, val=
);
        if (raw_pci_ext_ops)
                return raw_pci_ext_ops->write(domain, bus, devfn, reg, len,=
 val);

and then somewhere in Vmware hypervisor initialization code
(arch/x86/kernel/cpu/vmware.c) you do

 raw_pci_ext_ops->rating =3D 100;

why wouldn't it work?=20

(diclaimer: completely untested, raw_pci_ops/raw_pci_ext_ops
initialization has to be checked so 'rating' is not garbage).

>
> It's a generic solution for all hypervisor (sorry for earlier wrong
> Subject), not specific to VMware. Further looking for feedback if it's
> impacting to any hypervisor.

That's the tricky part. We can check modern hypervisor versions, but
what about all other versions in existence? How can we know that there's
no QEMU/Hyper-V/... version out there where MMIO path is broken? I'd
suggest we limit the change to Vmware hypervisor, other hypervisors may
use the same mechanism (like the one above) later (but the person
suggesting the patch is always responsible for the research why it is
safe to do so).

--=20
Vitaly

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/87zgf3pfd1.fsf%40redhat.com.
