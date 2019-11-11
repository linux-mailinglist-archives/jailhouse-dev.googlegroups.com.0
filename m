Return-Path: <jailhouse-dev+bncBCQYDA7264GRBPMQU3XAKGQE3Z2R7IQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0681CF7879
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 17:11:42 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id n11sf1150292lji.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 08:11:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573488701; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZxWanMl04u1Z2usuXd4zSgRN2o17oIxs455ZLDmoeJqdIlROjN0oP9+4WSQbsO1M9c
         4/0qxQWzCIhHwb89eqZtbo9dNE0PVF0UEO5ALWeqy6p0l3cdnHqgUu1xChygB09cmHLB
         2uzfKNIs4vcbDFH6f11K15cJJ8GEkOmj8WeX3d0DeNdBYZfUPXfDWSWj82X4jjVpsdc1
         vRjq3S2xR/7tFdqbMbGsNHAbFWWAm6NVsFyjTcTJCAbhh2m/fJygGPIwSo1g37H1B15g
         dv+BupdPfge7oOu1SWDavjeenKiOU2swlEg474Eq2axNjfXFgLHIggwG8KFAksSu6skg
         /yPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=Eg3m6BLsyRF9vC/cycPSyPXkyMRs1bCkAvm9A4+W/e8=;
        b=AfWbpIpB2ovs7a3tZzQQxviLtG7lMdzKGUd++aEwnUAjJrqbRF+9XLmdaVMiwB1J27
         5vCzIcj/aoKoNzEqMT7hBrKVRv9x/PsH4l/FywPy3cXugEn5V7eM9gb8zAi2HZzgcwUX
         n86cOEqBnkF9keHojEAsXM+8KbOgpdUppiq6rFh8Z1VeAQ9rTxMF9Oh9e5FyJuXI53P/
         W3KOTC+m0kvG65KHgs1SXvQB1f4DcUEWNv/baE5ByVDENu3AUtfAUk5VeGk3bip8scLV
         5/52DVjrvNeU9qv6NfBMeWiGnJrS/YB78DCVbIzaWV29IhAj+w3EbglTAGQpESG44Wyw
         ZzGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d3AIAR0r;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-transfer-encoding:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Eg3m6BLsyRF9vC/cycPSyPXkyMRs1bCkAvm9A4+W/e8=;
        b=Y8KPSCvYoY1pCIvfSHUDCUdbOjbDfq3ssFlxHDtqA/nRAyoWb0I895D5eXVwPtuJ96
         eUtpUp/Zm414MaFnPaPB5+nwsNiPEYjRVaGuyaQ5G9jeAI2M5OKyMmVEiTDWGUCrrc8z
         /1avnsmKuv+AgU+j3Fy2FzYnb87Cv0i/kqRn+3FWzc6m7YsQIbnzcbp9MeH9b0chyjcK
         kxa66J82MLDMQV9LbOjZ6/cU/8D5rQuyY5dtHDbVWwisKeoZWxhW9Fm0W3NsyBW7Ba7F
         uH09EKkmgMU7HbuLQ/GIB9F4F4k5FZbfoJhDtkAWSk47eb2Tr4+rOuQZv4RH98j7ItOM
         fPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-transfer-encoding
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Eg3m6BLsyRF9vC/cycPSyPXkyMRs1bCkAvm9A4+W/e8=;
        b=iah3O/4BGKCPK/LhS6/QGsfXvKQF2MVZuCcmflyLtbqhE1armYnXJ1RIUAE3WG0aKp
         ElAzbcITPkzhe8jD1a0wZDgsFvZAMR8s4/ysUGD0qvlUuYCHJczPwZNwc0KEC/iyxGH0
         OQxDywXHb3nzZU2pvFjYKBW/zu8vYk7/5eNJD252SQoQ4l8i6HQ187yNxYAsLdd2War1
         4JS5//i9xikWfakXIQAEsqgDkg99mXBWKxQWRn3fNp9JYvpQk9HJ8c5gzg6EL/KjzIpS
         9OeV38w7RddgvieDWKOt2p2NdB+wSR8sFIP4V9/2MIfVPxJwLGnHSjATSLyALEMp9PSn
         s+jA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUMNmj98bs5kCNCrAdbLuaWcNSaSi+wpKsAX4lEFgKB48neNrSu
	U0iVGO9QT4ZK821kwVLVW6g=
X-Google-Smtp-Source: APXvYqyuKjAYg5z6e3HwcOQUdcRTwqBhyAS75z5eTDcXT0dZDnLknygr8Oi8+HSX/ojGQRmoalWsrA==
X-Received: by 2002:a2e:3a09:: with SMTP id h9mr17318415lja.33.1573488701549;
        Mon, 11 Nov 2019 08:11:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:904c:: with SMTP id n12ls1195177ljg.8.gmail; Mon, 11 Nov
 2019 08:11:40 -0800 (PST)
X-Received: by 2002:a2e:970a:: with SMTP id r10mr17179064lji.142.1573488700487;
        Mon, 11 Nov 2019 08:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573488700; cv=none;
        d=google.com; s=arc-20160816;
        b=MlIVKDgvNjJOYneOUFQ0nOIVY7kkoWIvCAtdlvApMnD3Slct/5a62t4HhXDov3t2aL
         C/LL/ZVHnA3FFWkLim+9kAGiZ2+SaNoSN+ZHGKs+WGb2voKFI1RwO1efTn2p9wXNZGuR
         DYMP4xfTal5vvsdRccvx3cndkRI2Pn1RrCirG1PvgAgpxZ+M1yPTWUBkB7n7qkXh3i4E
         myk0f+efkKI3vNga4Y5Tt5AyotiHm99gP5m8yv4BCUwKYXjI2iO8wR+Se0uivSOewsR/
         1AmXJfX5Vw4K6fpZQcNoxHvf+WriNpCCXjGvddQtalcwuqyHclcjDUKWobjJUMeqCVQx
         m6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2fuRljcPrX0n6JAMXFKZPic1W8wiLyJlEn7JPLjCa3w=;
        b=kJ6Y6P3pubhdAFoY1qkKkUm2WsvVFqVgQocdiTnGwHjtQ9j/3rLo8BD23G1TV9VoNu
         wNXcwJkS/l4oefYyfBNxZRwMWY/dlLlaCiRmL7XtgDS0zYHH2Nrh9TAyKLCdru/SeyGC
         gdNGrddDmK2BQXTFnU+Rbtp95oXX3WjrF17HRrnM5JgzSRK3jE7xn/1/ZGvIO13zmONJ
         m9l2SG8O+C4Vf28GLY+5WLt5LaX1FWQdj3Ve/sXlMcpyRx9yTeoWqvMFHOicmGRnaqdH
         THvRL7VijercgZkqZw7hgb1FqutGr/egvl6qgsuaZvjepwwAPqOmENaH/FSa3nevoYYD
         FVMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d3AIAR0r;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by gmr-mx.google.com with ESMTPS id h21si1178711lja.5.2019.11.11.08.11.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 08:11:40 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-v6sf_RNZOfK1alW_xLkXJQ-1; Mon, 11 Nov 2019 11:11:36 -0500
Received: by mail-qk1-f199.google.com with SMTP id 125so8076613qkj.12
        for <jailhouse-dev@googlegroups.com>; Mon, 11 Nov 2019 08:11:36 -0800 (PST)
X-Received: by 2002:ac8:13ca:: with SMTP id i10mr25526864qtj.214.1573488695629;
        Mon, 11 Nov 2019 08:11:35 -0800 (PST)
X-Received: by 2002:ac8:13ca:: with SMTP id i10mr25526828qtj.214.1573488695388;
        Mon, 11 Nov 2019 08:11:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
        by smtp.gmail.com with ESMTPSA id j25sm7053345qkk.3.2019.11.11.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 08:11:34 -0800 (PST)
Date: Mon, 11 Nov 2019 11:11:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, liang yan <lyan@suse.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	Claudio Fontana <claudio.fontana@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
Message-ID: <20191111105850-mutt-send-email-mst@kernel.org>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
 <20191111100607-mutt-send-email-mst@kernel.org>
 <20191111152743.GM814211@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191111152743.GM814211@redhat.com>
X-MC-Unique: v6sf_RNZOfK1alW_xLkXJQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=d3AIAR0r;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81
 as permitted sender) smtp.mailfrom=mst@redhat.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=redhat.com
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

On Mon, Nov 11, 2019 at 03:27:43PM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
> > On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
> > > On 11.11.19 14:45, Michael S. Tsirkin wrote:
> > > > On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> > > > > +| Offset | Register               | Content                     =
                         |
> > > > > +|-------:|:-----------------------|:----------------------------=
-------------------------|
> > > > > +|    00h | Vendor ID              | 1AF4h                       =
                         |
> > > > > +|    02h | Device ID              | 1110h                       =
                         |
> > > >=20
> > > > Given it's a virtio vendor ID, please reserve a device ID
> > > > with the virtio TC.
> > >=20
> > > Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this fi=
nally
> > > official.
> > >=20
> >=20
> > And I guess we will just mark it reserved or something right?
> > Since at least IVSHMEM 1 isn't a virtio device.
> > And will you be reusing same ID for IVSHMEM 2 or a new one?
>=20
> 1110h isn't under either of the virtio PCI device ID allowed ranges
> according to the spec:
>=20
>   "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
>    ID 0x1000 through 0x107F inclusive is a virtio device.
>    ...
>    Additionally, devices MAY utilize a Transitional PCI Device=20
>    ID range, 0x1000 to 0x103F depending on the device type. "
>=20
> So there's no need to reserve 0x1110h from the virtio spec POV.

Well we do have:

	B.3
	What Device Number?
	Device numbers can be reserved by the OASIS committee: email virtio-dev@li=
sts.oasis-open.org to secure
	a unique one.
	Meanwhile for experimental drivers, use 65535 and work backwards.

So it seems it can  in theory conflict at least with experimental virtio de=
vices.

Really it's messy that people are reusing the virtio vendor ID for
random stuff - getting a vendor ID is only hard for a hobbyist, any big
company already has an ID - but if it is a hobbyist and they at least
register then doesn't cause much harm.

E.g. Red Hat switched to 1b36 for new non virtio devices and I think that's
nicer.


> I have, however, ensured it is assigned to ivshmem from POV of
> Red Hat's own internal tracking of allocated device IDs, under
> its vendor ID.

Thanks!

> If ivshmem 2 is now a virtio device, then it is a good thing that
> it will get a new/different PCI device ID, to show that it is not
> compatible with the old device impl.
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191111105850-mutt-send-email-mst%40kernel.org.
