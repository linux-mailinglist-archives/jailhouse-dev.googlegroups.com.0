Return-Path: <jailhouse-dev+bncBCZNXZV44IJBBF6656MQMGQETRYTJ4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF855F3E59
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Oct 2022 10:30:17 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id g6-20020ac84b66000000b0035cf832dec9sf8782781qts.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Oct 2022 01:30:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664872216; cv=pass;
        d=google.com; s=arc-20160816;
        b=qNB8rLvXxSdTOam8X3Y+QHnNOL+MJKGpUjqcTWj3o1A1e7cm5l/78u1MJbdkWIDH0e
         yczFO9L+OEcm2XCgfpKz4e3ZWuWbJcXg+OugjCjlumO2zSvSagkIsiNbnGq0HD90UzVj
         MUAD9zL3Xh/Z7H/VNJTSiH+sNrJrABLH4HwPsD8z74Dtc9+tQ3xDERWhQDWtauBuR1zM
         /2BET2hOUj/h/+SQj1Sw38Y9b0tDbPJucC7G0WXXNyNdZUQCntzqyKjqzQLy/7XJnmRz
         p5NAlZKWm9+U8uoEiTTTtE0RejvqwDVnCEYpoGUMlFpiBs2ahyLIdQ1YZGywkuwFQu6K
         NIWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:sender:dkim-signature;
        bh=In56rSnKFC4rh3vDjMdvyWm1wK/ufxL7fi+RYSLdTg8=;
        b=nXDYaZ114xjD8Fc0n/GYDHsW2AeUJHyCG86Bu9Mp2vuDOpLybOSF69gsTiU6F7DE8f
         Nhu4K60RL7VdNJ0O2JyE854AlVZLtZndn7vLnwTJ+MCFunVYPgJIXjB8WxQkuGVNdwxT
         voyy5WUib7D2SWGhHNpisCcLUjgipm3BHBoApeQF1Uys1Yen+UxjidIqtKh07r70l+Xx
         ZfEfpYD/Xw/QXyaOP6WtKBfUQIwtJb/iSX96BX8dEjmvfWcl/6AUJzZuP6jOhWhmyw7J
         K9vErT7l8kyAvfoauu7OgpdjZYN9SjpAP7JAJrMr07YF38aic18BlLzsgN49xOHDwhbb
         hI+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/Aw2c51";
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :date:references:in-reply-to:subject:cc:to:from:sender:from:to:cc
         :subject:date;
        bh=In56rSnKFC4rh3vDjMdvyWm1wK/ufxL7fi+RYSLdTg8=;
        b=izaZVAOFDc2fDBvsn7J1BuFtPhxQjxUB41j1drk9KgnqWcTFRNg3ek/pY1UmBSaxH2
         Vb40vVyUgSYtsw+DJlKY5upzyDnJagQNxiyc05kQLzhv/N9RTN9n+gtEksgd/2BAF174
         YTXp0CDNaVU5fVpkESeno96VxxydRmMgTA8FzPgokxpJcjGT79EP1ohUzfxkAwb3nA1p
         UETc3OAHimIalLVk3INi4u/ZwCvc8EaLULMW2OKhA7zJsBb5rk26LwBab9O2qTX9m/Fa
         FY+0U1lmMiOoL1eDWDAxeOojtoXw1ribbeYkUVZXWTUkLUZ6cNi5u/vkl5iAaO6niFQ6
         TZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=In56rSnKFC4rh3vDjMdvyWm1wK/ufxL7fi+RYSLdTg8=;
        b=shK4aXns2yGSC4kRUREHJCV6itw4KV5uYVzFhgUTYGBOd0H/cM3dXKmw0uxZSlJgqm
         vBSJEz5H1cZB8gm7a8R/MZE++RR7/xoav+h+90MSoWUYPv27gTDaHQTpneAIpQtwRAFo
         rno4BApSkc+bHRdCrNUyLxAEwFciN83KdCX+zr22yvo4rWyrpLjjB1N42nils3q+t1wn
         vNOjuiBRQReEFqULaYu0JWY9Zbep2oyHIXUar8c+FuFdWr4INAU8n53HAzdhWZ38fiDt
         mmuBOl2+foRlTNkz1xwkzfHqmalwy9OD5ZrDRTRVBvxbOyPeukQU/x+ZyUXnae6j12Vu
         grUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1GtP4/XCj16GPrTGzAmBg6ISVN52ZIbJh03uFZYj5ALO3kKR+y
	KSxcrA70LvzUYIPNuiz6x7s=
X-Google-Smtp-Source: AMsMyM6RWq6fVhtdGIh0+V9ELd8xBUOyUFsGSUprzaR6SXjyfcilFLzPXAygo58ns+mX7ydbmcTuQA==
X-Received: by 2002:a05:622a:1ba7:b0:35c:b9f1:e1eb with SMTP id bp39-20020a05622a1ba700b0035cb9f1e1ebmr18618217qtb.323.1664872216149;
        Tue, 04 Oct 2022 01:30:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:6104:b0:344:94bf:7994 with SMTP id
 hg4-20020a05622a610400b0034494bf7994ls8524924qtb.0.-pod-prod-gmail; Tue, 04
 Oct 2022 01:30:15 -0700 (PDT)
X-Received: by 2002:ac8:5d8b:0:b0:35b:b035:9573 with SMTP id d11-20020ac85d8b000000b0035bb0359573mr18423727qtx.632.1664872215385;
        Tue, 04 Oct 2022 01:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664872215; cv=none;
        d=google.com; s=arc-20160816;
        b=TIRfiE0Lle2cy86F2pwaAfm0KP8Me2jh/1lJdjZlBNboEAGp2PTevDEG2JK+bUZxHj
         e2AYOSay8rSAN6+9Mizwy8zknGxaxA8zBDqAdG+f3Z6fRtyuej6AvMAcsFeBYTAmvvu4
         HjcoahZNmGQC0rOD+5VctVkWKe/5/prRJFdOR5tkYbClvPjOKQib0SPIb6UgocxMhN9Y
         RterP4RNYNYjAGYXSw7I/Lc3fqQZaIKY6h9Y45U5jq/QsviIfNhktY1hRulT2O7n6dem
         F+SzhcetQ0TbqggpRY7rji/PaKxa0hC3kij/ZOSjDBWBuTbsrmXV+1Iirp34GYI0irP+
         AS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=mx+TIb5N4ENHhgvLtFzyQ3iRnSCgSSPj/Ny8vTXS3Nk=;
        b=BkGfUV/NbQQQkBEn6IJrM6ZyVbPDV/7gyC6TcsKveHRIv7bSwO+DfWh06PAn0SP0Uk
         rtokzNjvcfZr0nbwO/qS981C9+FjS1ggRDS+Z37D1+5lgCbnAOXZpF6tXR/6qVjZIgMk
         MNLH1ID4ukDOLZagsuPsFZhGM1BFnhUps25d5atb7g4QGP4Gu+JDa5y5MTlp70qGz2fj
         1hK202OojAQLOzJvDygPFBe5nQ+KtyxFlDs0/G6FH8c1fHQ9Bdg58WSrNiSpCHKNCe+K
         dLCJVi0CJIKP5p8ost5dJRVbr+zsfKMNYS6twDwUw+axZUFlF17SWYyq6Y3KHApvLsAx
         1+DQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/Aw2c51";
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by gmr-mx.google.com with ESMTPS id y6-20020ae9f406000000b006ce4c1110bfsi599592qkl.0.2022.10.04.01.30.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of vkuznets@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-Q24b7zloP7C-TeBk8Hqlqw-1; Tue, 04 Oct 2022 04:30:13 -0400
X-MC-Unique: Q24b7zloP7C-TeBk8Hqlqw-1
Received: by mail-ed1-f69.google.com with SMTP id i17-20020a05640242d100b0044f18a5379aso10750356edc.21
        for <jailhouse-dev@googlegroups.com>; Tue, 04 Oct 2022 01:30:13 -0700 (PDT)
X-Received: by 2002:a17:907:1626:b0:782:e490:4f4 with SMTP id hb38-20020a170907162600b00782e49004f4mr18347586ejc.464.1664872212799;
        Tue, 04 Oct 2022 01:30:12 -0700 (PDT)
X-Received: by 2002:a17:907:1626:b0:782:e490:4f4 with SMTP id hb38-20020a170907162600b00782e49004f4mr18347564ejc.464.1664872212563;
        Tue, 04 Oct 2022 01:30:12 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id by30-20020a0564021b1e00b004590d4e35cdsm1198745edb.54.2022.10.04.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 01:30:11 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Nadav Amit <namit@vmware.com>, Alexander Graf <graf@amazon.com>, Ajay
 Kaher <akaher@vmware.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
 <srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
 <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
In-Reply-To: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
 <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com>
 <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
Date: Tue, 04 Oct 2022 10:30:10 +0200
Message-ID: <87lepw9ejx.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: vkuznets@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b="F/Aw2c51";
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

Nadav Amit <namit@vmware.com> writes:

> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>> better, introducing a new global var is our 'last resort' and should be
>> avoided whenever possible. Alternatively, you can add a
>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>> hypervisor_x86' but I'm unsure if it's better.
>>=20
>> Also, please check Alex' question/suggestion.
>
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
>
> IOW, how about doing something along the lines of (not tested):
>

Works for me. Going forward, the intention shoud be to also clear the
bug on other x86 hypervisors, e.g. we test modern Hyper-V versions and
if MMIO works well we clear it, we test modern QEMU/KVM setups and if
MMIO works introduce a feature bit somewhere and also clear the bug in
the guest when the bit is set.

--=20
Vitaly

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/87lepw9ejx.fsf%40redhat.com.
