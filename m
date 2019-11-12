Return-Path: <jailhouse-dev+bncBCQYDA7264GRBCOPVHXAKGQE375BPKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A5F8A18
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Nov 2019 09:04:27 +0100 (CET)
Received: by mail-pg1-x539.google.com with SMTP id t11sf13948594pgm.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Nov 2019 00:04:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573545866; cv=pass;
        d=google.com; s=arc-20160816;
        b=gXPvbDl3FKEKxBbrb6+BCRwLxXiWgq1Xz4tjGAyUofwvernDg4HOegpRBbs12xWe5V
         Ny96cF6KiHfml4zJvgzCagRgHnPtfrWXn1xAMvjbpPu+PJTBvkDlFE3XyOGQ2zWsZWCr
         Cf2HyYAb1iTlbeCvxhHSXYaYs2Fa9+BZD74uqWcuAJwjBG78skvlY1MwBUwbSzAqGd9i
         YIeOw7pPM7RzxROzABkTxfe/b0N8Mz82c9U8h0Ql9thSHVYNTTIh+Za/PCH66YGzNijE
         osU+1soLlGod7wlHh1xGaDB9xDJ2HBG2HxZelZMxYYbQMvNGEIpOaggHuBeCRKWYKYrl
         Rmtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=diNv/all9du1LgsoBHA68RSdK3uKouk0oLnOdvJf4lE=;
        b=aAPXq0MBXUpyTKBRVDCk604kFrZID8hWzOLvmxRGIuvbTaqXYrZ+LBk9qFKWNFavx5
         uQ0Zl6lbZ6KoHpP9ftBKwUaCI+Ro3anLFZDTuAZD4djDcVsxmwLZ4OqUCc6AkHWdUHnL
         OHLGF+Wk4yBqdrR4mzcdqU/JGTVYMqqq1eluudZ9/kam2CW7pXD4g9cCvvAw/x4Rftwq
         vBxovrxtPK62ydLqy7N3+1rtc3Q4B/exkATQGQxKmpq+m7rRljLER6Pi9TMG3anufelF
         z4FtQpvPFcjdxnsrHcdwye84/w74tgLfjlJdoshqjbUPXRhujS7AHMqTKA4SibQRlOcK
         hdvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R34f184W;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-transfer-encoding:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=diNv/all9du1LgsoBHA68RSdK3uKouk0oLnOdvJf4lE=;
        b=DEL1/XJpXHjdhj4IejoqtSJlMAlXLMUH8TaNyI91rrmLHCRgFQ3/tmTaZtr9Dg7iqN
         kiSYZBJpw1SP67OVOp4zjLljTckRmZ8mXoamlq3XNceQEILhIl2VdHGUAtcH5PJ7oDCn
         YWWadxia40luF73Q3vgAgThgSkhI4uX/729PJdstxNi2ObSwh/XYU4WQ4YCJyDr9TR68
         FtuMTNbZBApCwWtSrywizM+ZdUF5JGJdxZbc5PsDEePuO3Xgj1xwgNDa4eOS6OWomNhU
         Ny9bj72FwGTAfd4e/8Q+zHnX3eDAPzolbcsfTCf7/l62apkxXd+n/+/3Mh3nL5NjugeV
         vGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-transfer-encoding
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=diNv/all9du1LgsoBHA68RSdK3uKouk0oLnOdvJf4lE=;
        b=G/emc0irnoAmOnXtSdhHRGiCILQfr7GkoI4s2K3R/AFrXEkaxJ8m7PzCj/oNOF2LYK
         HKioeAiwOgAIiAX34LWHXvT6882g071GB/bUkaWkL+EOxy/GOc/PRtHiweuaBoKC2JAt
         gnGRNlgsNo1FhY1DR4ulTxzwSea7tKFamZw30/j14LoIRntS3/IZ7fvHkIiNSLB6ZLyu
         bSWfhCsNhy8NVPboAyIFNETe4Z6kdZ8JFh9IHRoj6EAugst1NcPBC79JxOCj8mLaeWXj
         7K4WWZ+4XpJjwvD9nuMKeyYMHMXwe8br1EpXkTFa5qT2DjxLUB2OKNGycLCIkxweETwu
         W02w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUpkN0tulV7tLuAOAeCHwEtN0zcdE8jvitcJvVO02g6ZHqkQ55+
	moE5ZHa8DWhzkKSxTZbWuAs=
X-Google-Smtp-Source: APXvYqzFWhPIBxzxdENKibp2OnA4qT3ySze79QVz3BaxAeYwcLyLUhg8plEVRB20lRal97/BxKThjw==
X-Received: by 2002:a63:f916:: with SMTP id h22mr34641751pgi.423.1573545865873;
        Tue, 12 Nov 2019 00:04:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:b042:: with SMTP id z2ls431322pgo.16.gmail; Tue, 12 Nov
 2019 00:04:25 -0800 (PST)
X-Received: by 2002:a63:f418:: with SMTP id g24mr33743042pgi.15.1573545865151;
        Tue, 12 Nov 2019 00:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573545865; cv=none;
        d=google.com; s=arc-20160816;
        b=Ke+8ZobE+Z5KJtAolCOZw304pTvXMBnGoci2UWdskrA7uwXKRE8o2oku0AZX52uSo2
         fuhN7yZg+cdRcbejbVNwLwWyTYapxeUsPB4kYrdt2EWUT4k6eZLlY/YCPcR7vm2ZjfSj
         njLMPkGVhCGxzbrqHrgPkEb0Et1oqlD4q5lj5LXiOUFx29Advg9yBskH1EjHYGRZ04n5
         49GQaRYGIYAYr2in+ddFxE6IxuBrQsqFpHgrKOo69G4H5nm8jlwY3oDvz/kUFHkC7cH8
         76UieFaXI6p5jVGPXdDcV8DxGVmkfqXBvKhbzFxsx2NkonTPshvOq+NX8W+pxWFFTxKx
         YSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=J5g7YF7I5AGOF51+RGR5bsfcIsWbceWHvXyfqlK3BmA=;
        b=u35UCCqQ4cg3whSJKgv/IcldC46n7kAefkka4mPYCJ2hDczlkOpsk3Yaw6NLKNiKrZ
         mugH1hepAAOwaxLzGPvILYu7Om/Kx1QAosPqSc22ecWe/8Xbz7QbgdSjQH+yRTPQrOTE
         g6/ufWhPRqOag1X+ndXctf/8wTWPcyDdglQtUgFNPVqvHxYucG3M1XKaCbdYvaIU8v/P
         Spjp5/CuE6jCzI1OIff2LuDY5xlczf+0/xHZEPTIIZSAIJ1IQOFIz6d6aQnvALpd1sgs
         tFviOS4GYNeScN9MxQpMTCOUHKJQjMxDzcCMP1bMSrcavhxgIFAfEeY69BA+pe69iu7k
         mVxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R34f184W;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by gmr-mx.google.com with ESMTPS id b15si1093851pgw.5.2019.11.12.00.04.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 00:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-6-8XrHS7O7eUB1RY1iWEDw-1; Tue, 12 Nov 2019 03:04:20 -0500
Received: by mail-qv1-f71.google.com with SMTP id g30so7991607qvb.11
        for <jailhouse-dev@googlegroups.com>; Tue, 12 Nov 2019 00:04:20 -0800 (PST)
X-Received: by 2002:a37:424a:: with SMTP id p71mr4641044qka.194.1573545860398;
        Tue, 12 Nov 2019 00:04:20 -0800 (PST)
X-Received: by 2002:a37:424a:: with SMTP id p71mr4641026qka.194.1573545860087;
        Tue, 12 Nov 2019 00:04:20 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
        by smtp.gmail.com with ESMTPSA id x30sm8465630qtc.7.2019.11.12.00.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 00:04:19 -0800 (PST)
Date: Tue, 12 Nov 2019 03:04:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	liang yan <lyan@suse.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	Claudio Fontana <claudio.fontana@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
Message-ID: <20191112024400-mutt-send-email-mst@kernel.org>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
 <20191111100607-mutt-send-email-mst@kernel.org>
 <20191111152743.GM814211@redhat.com>
 <20191111105850-mutt-send-email-mst@kernel.org>
 <ef21ed49-d315-4ee5-716b-096d8af1d79c@siemens.com>
MIME-Version: 1.0
In-Reply-To: <ef21ed49-d315-4ee5-716b-096d8af1d79c@siemens.com>
X-MC-Unique: 6-8XrHS7O7eUB1RY1iWEDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=R34f184W;
       spf=pass (google.com: domain of mst@redhat.com designates
 205.139.110.61 as permitted sender) smtp.mailfrom=mst@redhat.com;
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

On Mon, Nov 11, 2019 at 05:38:29PM +0100, Jan Kiszka wrote:
> On 11.11.19 17:11, Michael S. Tsirkin wrote:
> > On Mon, Nov 11, 2019 at 03:27:43PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
> > > > On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
> > > > > On 11.11.19 14:45, Michael S. Tsirkin wrote:
> > > > > > On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> > > > > > > +| Offset | Register               | Content                 =
                             |
> > > > > > > +|-------:|:-----------------------|:------------------------=
-----------------------------|
> > > > > > > +|    00h | Vendor ID              | 1AF4h                   =
                             |
> > > > > > > +|    02h | Device ID              | 1110h                   =
                             |
> > > > > >=20
> > > > > > Given it's a virtio vendor ID, please reserve a device ID
> > > > > > with the virtio TC.
> > > > >=20
> > > > > Yeah, QEMU's IVSHMEM was always using that. I'm happy to make thi=
s finally
> > > > > official.
> > > > >=20
> > > >=20
> > > > And I guess we will just mark it reserved or something right?
> > > > Since at least IVSHMEM 1 isn't a virtio device.
> > > > And will you be reusing same ID for IVSHMEM 2 or a new one?
> > >=20
> > > 1110h isn't under either of the virtio PCI device ID allowed ranges
> > > according to the spec:
> > >=20
> > >    "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
> > >     ID 0x1000 through 0x107F inclusive is a virtio device.
> > >     ...
> > >     Additionally, devices MAY utilize a Transitional PCI Device
> > >     ID range, 0x1000 to 0x103F depending on the device type. "
> > >=20
> > > So there's no need to reserve 0x1110h from the virtio spec POV.
> >=20
> > Well we do have:
> >=20
> > 	B.3
> > 	What Device Number?
> > 	Device numbers can be reserved by the OASIS committee: email virtio-de=
v@lists.oasis-open.org to secure
> > 	a unique one.
> > 	Meanwhile for experimental drivers, use 65535 and work backwards.
> >=20
> > So it seems it can  in theory conflict at least with experimental virti=
o devices.
> >=20
> > Really it's messy that people are reusing the virtio vendor ID for
> > random stuff - getting a vendor ID is only hard for a hobbyist, any big
> > company already has an ID - but if it is a hobbyist and they at least
> > register then doesn't cause much harm.
>=20
> Note that ivshmem came from a research environment. I do know if there wa=
s a
> check for the IDs at the point the code was merged.
>=20
> That said, I may get a device ID here as well, provided I can explain tha=
t
> not a single "product" will own it, but rather an open specification.
>=20
> Jan

OK, up to you - if you decide you want an ID reserved, pls let us know.

At this point I'm not sure I have a good grasp which IDs are
registered where anymore. If someone can write it up, that would
be great too!

> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191112024400-mutt-send-email-mst%40kernel.org.
