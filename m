Return-Path: <jailhouse-dev+bncBCQYDA7264GRBYVBSGNAMGQEGNPNEZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A35FA265
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Oct 2022 19:05:40 +0200 (CEST)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-3584be56efbsf110821887b3.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Oct 2022 10:05:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1665421539; cv=pass;
        d=google.com; s=arc-20160816;
        b=nyouu891Nqyrv/qQG4d5bGXFt1PmlqeWNtTNuxkgu48fRCKnMPlZtyUGcRWYzoF8AV
         APf6A/Zi8dXfpgIeUwac+LpskPLmh/3nZBBxzgs6xhEtoNdn1z0B5kXJrbVNx7xWWLBY
         A8wtrVEYPgK+F8wxtB2o3tBOap+fTLeO4R/MVcOubgiov6Ep7+uAoudYGIxSy9xYUuOR
         Rhcsblr5TkH0oxH634hXq2TKla4OGfASkSy47v5CLanEFQcXiEqmoDZ68e33BmYER1rE
         6s7XQ7cwQlte3TooIOOVYw0Qkt4PcHYLcTvMXJ9GxN6hHv8kLZavbve/Wu/IE/BHfgDL
         4uoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:sender:dkim-signature;
        bh=lhPeDBKI3tvBOUdlNaSWlEl1NH5WRgjk129QefP1XzM=;
        b=si+3/cclY54VslzebgvDW/9BPpMz8oz42HbWg50J4paDn5ogzOhgRpBhdHkz5me577
         j2Nw6wWHDdd8VlT7b7GQR/1QnhRAdM4llW67c6pdR7BfeyYdTLzwUo1sT/r9ty3Mk2Ih
         2dhJD2UZJ83+zIy//LMP526um8DLIIgS8SqT+aPntwFjJDt1/glnVIsjbxF6pw4JIm+0
         PcpwZKoGjf0W21f/Wmg0Jg+biQBKBiGZkf60igiFGPuc4C6FA5XALh5DJx3B005203Du
         Pfqox6IiDb3oGtJ7YuraIP+b8yKIAdyj7h+qRLGvQKOv1Yw3l8seZN1j2A8kZcJhg1uw
         BgUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TzQW09gh;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:content-disposition
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lhPeDBKI3tvBOUdlNaSWlEl1NH5WRgjk129QefP1XzM=;
        b=ba7gLLnS3U5dUUziFIT26jQIqTe9oRwSOEfKLU9vFTb0aH5X9btSdIpUC3SBuHE9pT
         5h7DWYNrLpc9DeAyYDXs245eyNIPyPxRLXANvedp2Yd0v/KVVJddd2ukfTCOZAxmfDT5
         gRrH4wu24G+pEaqgjmIYTrTbv5YC0IcaY5jre+YgHN7t9ttcXFDVgZE58hcZwoT+I7z6
         mR9Z6JKpb7RSpkRvO0zmg6Y1C9WMaGyNc4avW/TrSncSy6yJokDqzIVpk+0Vv4jbnEfm
         SWKJbEE8vXc89XnhjAfukcML1Oyw/07rqvINc2zY2R0VozZLy6STvdtm44PaqQZ+U5Ia
         lB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhPeDBKI3tvBOUdlNaSWlEl1NH5WRgjk129QefP1XzM=;
        b=A16dRz9al44zIqOlwDP+yJShGRoEbvuQLbuYeWERajhj9CsfVIK/v9xzFaSNJq75w3
         308S1m/HQ5O2o3MmQay+KNFlLTcyP6OIwZaYlPQ6tSU1oQWvWBGfCHf0wgaPRYz3VyX4
         ZbaGDin2qTaStPCEDko+r4mNHwgQq6MsMzlHpfoN9JF/JO0nx3AEpJQM6kXdrDpoIP3/
         DpWubOgFxGfmse6VYSgoBerx752Te+tsf5fp0WvobMAnJQIAjsuwW7789H0zwuzm0qSS
         iwQw/b9bjZQr2TPDWv3KK5kI//hBxpDMwe0xaox9VAwnr9Rmz/AA4Bog6AcVeHBFIe81
         Yq9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1t4Ad6znP8RGKBaQcR3xUdfD9aFQ/DiOT3mWw7Aoq/kFmFlXP7
	yrsn7vRbGMR44/PMjRTn1Xw=
X-Google-Smtp-Source: AMsMyM4OBI6wwUfqdWoxazIWPskJt+rt96xf7MnQPhk0saSom8FU4aPwootPsAPr4M5yd6QgDP7XkA==
X-Received: by 2002:a25:bd5:0:b0:6bf:f475:281f with SMTP id 204-20020a250bd5000000b006bff475281fmr12917928ybl.532.1665421539112;
        Mon, 10 Oct 2022 10:05:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b2a8:0:b0:6bd:b0a5:a153 with SMTP id k40-20020a25b2a8000000b006bdb0a5a153ls6085975ybj.1.-pod-prod-gmail;
 Mon, 10 Oct 2022 10:05:38 -0700 (PDT)
X-Received: by 2002:a25:e442:0:b0:6c0:fec7:af27 with SMTP id b63-20020a25e442000000b006c0fec7af27mr6470178ybh.329.1665421538204;
        Mon, 10 Oct 2022 10:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665421538; cv=none;
        d=google.com; s=arc-20160816;
        b=PkOH1eaeDMdSiInR1Zu87Nt0BWNFq/RzefTxw/Qd8z6SUA4+L/pP15ueoHAQsgkyD0
         PGZK0VZOdYS+Z7SRhluk2sYov4VKmru02SYjeEnfQpbA+LcxDCI7MXS0KufKbAQLRrDB
         IzBf3nhbm7q5bs4JZbH5WNV8UoksZPtO+gVlnliFbs/rB9HORT5iA2gttRhc1GnpXDHg
         /tFAHqQvjCvvaHPx1O0HIOIP+5VT9yYFUbC2Ydxh1mgAuLbliMmb+HIU9rZTA789vnTV
         JA3j5aGC3MK9+d62Oho1rsBFBweyWjepcRigS3EGo6Ms+3xxKRsScsrcQ4+VBnWwcGkz
         LWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=PIyB/HY40+8TeBToBpv65MXDYl/DWNxmK/k3JvGCIiE=;
        b=Mdm9v8w2Uwgn2Z1FM73dmedSC1zRLf2QBFnjB1WduS7HZLNrQXEA17V56b2JCXS9N1
         jOQZhfsOoAILCbZsyGuAEUQ4pwb9HIP5QvWXqzSo6m6tobLa0TuuAiw1PX5ZnJpJn86i
         jflR1cpdhaRcup/2Wa312AGZlTcGJlWyRuJIg9AH1SlYlisNUbNnnqhwA/3bHU7mvZDJ
         71+T4IPO3tSF043iw3LKS4uIIa/gGq+ylT1sn9QTsGBkSrICvm/SkreonjcLCUnFZoIj
         JMFbpZsstLE3+LSKL4lAlAdHmMt4DbXjdv5UzhmrAoMsp/iCZa+xz+KBW66Od+Gr4V32
         Jn/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TzQW09gh;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by gmr-mx.google.com with ESMTPS id bp1-20020a05690c068100b00330253b8e8asi663608ywb.0.2022.10.10.10.05.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 10:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-8ZYmWvL4OSeCL8VFK_nITw-1; Mon, 10 Oct 2022 13:05:36 -0400
X-MC-Unique: 8ZYmWvL4OSeCL8VFK_nITw-1
Received: by mail-wm1-f70.google.com with SMTP id c5-20020a1c3505000000b003c56da8e894so3088756wma.0
        for <jailhouse-dev@googlegroups.com>; Mon, 10 Oct 2022 10:05:36 -0700 (PDT)
X-Received: by 2002:a05:6000:551:b0:22e:4499:a478 with SMTP id b17-20020a056000055100b0022e4499a478mr12211627wrf.459.1665421535013;
        Mon, 10 Oct 2022 10:05:35 -0700 (PDT)
X-Received: by 2002:a05:6000:551:b0:22e:4499:a478 with SMTP id b17-20020a056000055100b0022e4499a478mr12211606wrf.459.1665421534723;
        Mon, 10 Oct 2022 10:05:34 -0700 (PDT)
Received: from redhat.com ([2.55.183.131])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c089300b003c5571c27a1sm7263313wmp.32.2022.10.10.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 10:05:34 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:05:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nadav Amit <namit@vmware.com>
Cc: Alexander Graf <graf@amazon.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
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
	"helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Message-ID: <20221010130413-mutt-send-email-mst@kernel.org>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
 <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com>
 <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
 <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
 <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
MIME-Version: 1.0
In-Reply-To: <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=TzQW09gh;
       spf=pass (google.com: domain of mst@redhat.com designates
 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
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

On Tue, Oct 04, 2022 at 06:48:11PM +0000, Nadav Amit wrote:
> On Oct 4, 2022, at 1:22 AM, Alexander Graf <graf@amazon.com> wrote:
>=20
> > =E2=9A=A0 External Email
> >=20
> > Hey Nadav,
> >=20
> > On 03.10.22 19:34, Nadav Amit wrote:
> >> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wro=
te:
> >>=20
> >>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
> >>> better, introducing a new global var is our 'last resort' and should =
be
> >>> avoided whenever possible. Alternatively, you can add a
> >>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
> >>> hypervisor_x86' but I'm unsure if it's better.
> >>>=20
> >>> Also, please check Alex' question/suggestion.
> >> Here is my take (and Ajay knows probably more than me):
> >>=20
> >> Looking briefly on MCFG, I do not see a clean way of using the ACPI ta=
ble.
> >> The two options are either to use a reserved field (which who knows, m=
ight
> >> be used one day) or some OEM ID. I am also not familiar with
> >> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about t=
hat.
> >>=20
> >> Anyhow, I understand (although not relate) to the objection for a new =
global
> >> variable. How about explicitly calling this hardware bug a =E2=80=9Cbu=
g=E2=80=9D and using
> >> the proper infrastructure? Calling it explicitly a bug may even push w=
hoever
> >> can to resolve it.
> >=20
> >=20
> > I am a lot more concerned with how we propagate it externally than
> > within Linux. If we hard code that all Linux kernels 6.2+ that are
> > running in VMware prefer ECAM over PIO, we lock ourselves into that
> > stance for better or worse, which means:
> >=20
> > * All past and future versions of any VMware hypervisor product have to
> > always allow ECAM access for any PCIe config space write
> > * No other hypervisor benefits from any of this without upstream code c=
hange
> > * No real hardware platform benefits from this without upstream code ch=
ange
> >=20
> > By moving it into MCFG, we can create a path for the outside environmen=
t
> > to tell the OS whether it's safe to use ECAM always. This obviously
> > doesn't work with MCFG as it stands today, we'd have to propose an MCFG
> > spec change to the PCI SIG's "PCI Firmware Specification" to add the
> > respective field. Future VMware versions could then always expose the
> > flag - and if you find it broken, remove it again.
> >=20
> > Putting all of the logic on which system potentially prefers ECAM over
> > PIO config space access into Linux is just a big hack that we should
> > avoid as much as possible.
>=20
> Thanks Alex. You raise important points. Let me try to break down your
> concerns slightly differently:
>=20
> 1. Enabling MMIO access should be selective, and potentially controlled b=
y
> the hypervisor. The very least a "chicken-bit=E2=80=9D is needed.
>=20
> 2. PCI SIG would change its specifications to address unclear hardware bu=
g.
>=20
> I think (1) makes sense and we can discuss different ways of addressing i=
t.
> But (2) would not happen in a reasonable timeline and seems to me as an
> unnecessary complication.
>=20
> But before we discuss how to address the issue, perhaps we need to first
> understand it better. I am not sure that I understand this MMIO bug, and =
so
> far nobody was able to provide exact details.
>=20
> So I went to have a look. It might not be super helpful, but for the reco=
rd,
> here is what I collected.
>=20
> First, we have commit d6ece5491ae71d ("i386/x86-64 Correct for broken MCF=
G
> tables on K8 systems=E2=80=9D). It tried to "try to discover all devices =
on bus 0
> that are unreachable using MM and fallback for them.=E2=80=9D Interesting=
ly, it
> seems similar to FreeBSD code (commit 2d10570afe2b3e) that also mentions =
K8
> and has similar detection logic in FreeBSD=E2=80=99s pcie_cfgregopen().
>=20
> Then commit a0ca9909609470 ("PCI x86: always use conf1 to access config
> space below 256 bytes=E2=80=9D). The correspondence [1] mentions some bug=
s: ATI
> chipset, VIA chipset, Intel 3 Series Express chipset family and some repo=
rts
> on Nvidia. It turned out some devices had problem probing - to figure out=
 if
> MMIO is broken - the way the previous patch did.

There's also a statement by Linus that MCFG might not cover all buses
in that thread.  I didn't think the implications through yet ...

> All of these bugs are circa 2008, of course. And note that FreeBSD did no=
t
> take a similar path. The correspondence around Linux patch is endless. I
> admit that I did not understand whether eventually the issues were found =
to
> be per-bus or per-device.
>=20
>=20
> Back to the matter at hand. The benefit of using the MCFG approach that y=
ou
> propose is that it can enable native systems to use MMIO as well. However=
,
> since the list of bugs is unclear and the problems might be device-specif=
ic,
> it is not clear what information BIOSes have that Linux doesn=E2=80=99t. =
In other
> words, the benefit of getting it into the specifications is questionable,
> and the complexity+time is high.
>=20
> Can we agree that the feature would be enabled explicitly by the hypervis=
or
> and Linux would enable it based on the hypervisor input (through some
> channel?)
>=20
> Thanks,
> Nadav
>=20
> [1] https://lore.kernel.org/all/20080112144030.GA19279@jurassic.park.msu.=
ru/T/#u

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20221010130413-mutt-send-email-mst%40kernel.org.
