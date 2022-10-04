Return-Path: <jailhouse-dev+bncBDZ5FWPBZIMRB5G256MQMGQESQHNTUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB945F3E2D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Oct 2022 10:23:19 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id a2-20020a5b0002000000b006b48689da76sf12582752ybp.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Oct 2022 01:23:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664871797; cv=pass;
        d=google.com; s=arc-20160816;
        b=0MQ0ZlqVgmhMHFshVUxq4lNN6q+lP1WLl9xv372bXXYsYe7joC430Aak9kDKdOQE45
         LPYPwoDmaiUIb/K4AC2I/L1fJDho0atDEcg4FVSWbC2/w1JGeXO/nmhPidvhg8vtQK5B
         VNpmA3OT/TFwzOKVKYAaDVw4GwpPF2SXbysHrK17NvNEE/lHOdTzHjgydqQKiL3Mywl8
         fQGSJ/43lRMmsh3r19VCqTGLhn+XpwEIsUGoxc0yxVm/rGRGqoE0jZ/xjEVZoI0vYczt
         DyPimjOpvPEGAriFarqdm/ly6m49HClwSt0tFYk8674EiwlJzrNerMo0r4bGlPMLjyLN
         3iRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:reply-to:content-transfer-encoding:precedence
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3vhiCXdIMFXgLbGfCh4irrBRXwArEWnyXa8rDeZXldM=;
        b=J3meSJcnhtimoyOEF/CeUfZq+EFhP2IsRZRvBZ/Ij+pYsaAEVcc8B4073XAHTAr9Eb
         sQ2YpjnGsa3KyX4O2TkCKTb4qE+RS27Q+ylvr6DC71nUNKBW0DjI2bOidVsXgURDV8v/
         o6eAxnVK/HnoGNbUaCHzO9tSKrFCX3YfxQiZsNcPvUFmefknPGzFdOFKiPGf65e7Y5OP
         Jt50Me0IvzsB6dy0tIxl+BXlvYjP6T6hohiWDiqVPjmY0AwW0TqVl5qLrUH7PXC7cws2
         r1EfJYuK9zzjRGpv5HBdIj3jGK7GSPvf/b0AvExFh4NdlYLvCipk/eDTvxS4avZrygu0
         Rsgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=q0H0B+FS;
       spf=pass (google.com: domain of prvs=26955097f=graf@amazon.de designates 99.78.197.218 as permitted sender) smtp.mailfrom="prvs=26955097f=graf@amazon.de";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:reply-to:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:precedence:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date;
        bh=3vhiCXdIMFXgLbGfCh4irrBRXwArEWnyXa8rDeZXldM=;
        b=s8m2VYZpubs41/KlL0W6wv35GLuBOVmXPYWMN5V6hNZo+zJXpQN0R0rniQ/5Ya6n7Y
         j050s2NNp99H9B59rprenAmQz7KChfPOm2Xq/O7l7Q/d6cYEHZJtatywWjW7o0ADU9yc
         N4SpBxnfJmuMrPPr8zDrXmz9ET90fjsHvZ62GtH8QdAWsU7qXl/d4Y2gUZKpWHUvSmXX
         Ki4FlsHMzDjIHYqAjEXu1Vad/4OC2fe/6Axhidzbq7zwUveOkV9yU0Jg7tphK4UyTV2r
         XI9EQ4RDS5A3qPkXKLpVeKgTFcO0yR6MDE+xJqRjjOmr6i9dotQG5S2IRegCfkS4R/Sc
         0fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:precedence:in-reply-to:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3vhiCXdIMFXgLbGfCh4irrBRXwArEWnyXa8rDeZXldM=;
        b=WWwcO0REYm4zlIUw7HxkaoOhmD7iKLxACEAISqMw+V6iC9UFqi/iUxMLwzuKuHpsrA
         QO9tCnsMffRB38kcfUDWz1E1SfExblvYqPJPP4139CTuf/5L8H7yfzQIDQJwEQ2DPbrZ
         xN90R0mzLNy7PgyyL40094o0/4dwb1Z/zFQRHgCA1e2v8Gop5wIHxVnKU2kilexZaY6I
         0nU/yxB+btAoiWFTpm8sLdDtVi4tBY/VR3ijZbRN8XnsTugjvXvQPJsL0VqWSie7e1df
         VI4UdOro4ov3Q7BOrNB86+ZzQSif/h3lli5r9IiSJexjqNFiY71i5k33CngZx7LBjCDn
         8dsA==
X-Gm-Message-State: ACrzQf0Jy/r6QcmYkud4F84OVlCEGvy7wwJZAQcAOrMqVF8eu2mCeiOq
	qwDmj1qp0/Tat+kyjk3uF/E=
X-Google-Smtp-Source: AMsMyM6mV0oQMhjs929Sox+LSI/Za9bqnZJOACSaUrEov+CBMHfBq6CoLRW65DLPB2fd7L0ixXNZvg==
X-Received: by 2002:a25:dbd0:0:b0:6bd:4796:157e with SMTP id g199-20020a25dbd0000000b006bd4796157emr12673087ybf.385.1664871797201;
        Tue, 04 Oct 2022 01:23:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:260e:0:b0:6be:3dd3:3579 with SMTP id m14-20020a25260e000000b006be3dd33579ls424840ybm.10.-pod-prod-gmail;
 Tue, 04 Oct 2022 01:23:16 -0700 (PDT)
X-Received: by 2002:a25:6610:0:b0:6bd:cd70:b6f6 with SMTP id a16-20020a256610000000b006bdcd70b6f6mr6758197ybc.68.1664871796124;
        Tue, 04 Oct 2022 01:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664871796; cv=none;
        d=google.com; s=arc-20160816;
        b=lANnJJRA7z5BquqRs/vc0Xpiru8qtNkY3Ku0+ptcr3waBWXDMVNCtLUtgQf96bl9u2
         lEcpWnLj+AFY912dsf/dFJBuq1aEvyHKb8fy3sJNZzZYEUfr9N/KSiqkuJUjawwM3s0z
         7n0j+Xgtk/LG3P238u1Ughr/0YRya+LRIyNStDnwLW94a4cZjiVpswmShpPEWfo7xJE3
         lh7xd+03RrD3cGtYNIGCKSDwh8gghE1e93fBlBQyemMrSQWOzQCbccH8fJGn5NNGBK78
         /AzrZRuf8Qq90FRN14KfXI7C+cTFPbzZMquEsMababGF1A4d6t0ZTY+0YGTI4zurz/ok
         55xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:precedence:in-reply-to:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LJNqYgt9+EkQuB9NNZOVvoJbSMyT9Vb0J5NzwhljRLA=;
        b=eqBV59rKjtdjhg61yD7ZyCf+XHxKWUxSY0aofaeWBk1P+zvHyPCMDEEHT025lCFBZK
         Zb2ipg5Y/aE1cglptnutSnQs6RDq0js4yHMZwRjtiDV5H125V41ctIqRE9dzegjQbE3g
         rTG9bv++McPZbymeFiObMWlNJC9Wd9Dy1reGl1yY1X6Jc3NdHoyTb9zkXcrk3KRu/ioK
         /fFnhjCDzimAPPbClVzGPDZgA9TbZvZnWBNj+31xTpJK6NuqUqZQQX3tVSbgEiT0ZscR
         6vQ4RVn9aP/RjVQ3O/ThO5bV8eD2gCryI/NsBnS8cpy12GN7mwBHT/ao4keYNUQZp0zd
         gPLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=q0H0B+FS;
       spf=pass (google.com: domain of prvs=26955097f=graf@amazon.de designates 99.78.197.218 as permitted sender) smtp.mailfrom="prvs=26955097f=graf@amazon.de";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com. [99.78.197.218])
        by gmr-mx.google.com with ESMTPS id j76-20020a25d24f000000b006be4b4f832esi13552ybg.2.2022.10.04.01.23.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of prvs=26955097f=graf@amazon.de designates 99.78.197.218 as permitted sender) client-ip=99.78.197.218;
X-IronPort-AV: E=Sophos;i="5.93,367,1654560000"; 
   d="scan'208";a="136675810"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-5c4a15b1.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 08:22:27 +0000
Received: from EX13MTAUWC001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2c-5c4a15b1.us-west-2.amazon.com (Postfix) with ESMTPS id A219D44FBC;
	Tue,  4 Oct 2022 08:22:22 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 4 Oct 2022 08:22:22 +0000
Received: from [10.95.66.18] (10.43.160.124) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.12; Tue, 4 Oct
 2022 08:22:16 +0000
Message-ID: <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
Date: Tue, 4 Oct 2022 10:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	Srivatsa Bhat <srivatsab@vmware.com>, "srivatsa@csail.mit.edu"
	<srivatsa@csail.mit.edu>, Alexey Makhalov <amakhalov@vmware.com>, "Vasavi
 Sirnapalli" <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
	<er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "acrn-dev@lists.projectacrn.org"
	<acrn-dev@lists.projectacrn.org>, "helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
From: "'Alexander Graf' via Jailhouse" <jailhouse-dev@googlegroups.com>
In-Reply-To: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
X-Originating-IP: [10.43.160.124]
X-ClientProxiedBy: EX13D06UWC004.ant.amazon.com (10.43.162.97) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: list
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: graf@amazon.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@amazon.com header.s=amazon201209 header.b=q0H0B+FS;       spf=pass
 (google.com: domain of prvs=26955097f=graf@amazon.de designates 99.78.197.218
 as permitted sender) smtp.mailfrom="prvs=26955097f=graf@amazon.de";
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

Hey Nadav,

On 03.10.22 19:34, Nadav Amit wrote:
> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>> better, introducing a new global var is our 'last resort' and should be
>> avoided whenever possible. Alternatively, you can add a
>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>> hypervisor_x86' but I'm unsure if it's better.
>>
>> Also, please check Alex' question/suggestion.
> Here is my take (and Ajay knows probably more than me):
>
> Looking briefly on MCFG, I do not see a clean way of using the ACPI table=
.
> The two options are either to use a reserved field (which who knows, migh=
t
> be used one day) or some OEM ID. I am also not familiar with
> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about that=
.
>
> Anyhow, I understand (although not relate) to the objection for a new glo=
bal
> variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=
=E2=80=9D and using
> the proper infrastructure? Calling it explicitly a bug may even push whoe=
ver
> can to resolve it.


I am a lot more concerned with how we propagate it externally than=20
within Linux. If we hard code that all Linux kernels 6.2+ that are=20
running in VMware prefer ECAM over PIO, we lock ourselves into that=20
stance for better or worse, which means:

* All past and future versions of any VMware hypervisor product have to=20
always allow ECAM access for any PCIe config space write
* No other hypervisor benefits from any of this without upstream code chang=
e
* No real hardware platform benefits from this without upstream code change

By moving it into MCFG, we can create a path for the outside environment=20
to tell the OS whether it's safe to use ECAM always. This obviously=20
doesn't work with MCFG as it stands today, we'd have to propose an MCFG=20
spec change to the PCI SIG's "PCI Firmware Specification" to add the=20
respective field. Future VMware versions could then always expose the=20
flag - and if you find it broken, remove it again.

Putting all of the logic on which system potentially prefers ECAM over=20
PIO config space access into Linux is just a big hack that we should=20
avoid as much as possible.


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
jailhouse-dev/f1a7e603-2e64-fd2a-1100-f2898060e3f7%40amazon.com.
