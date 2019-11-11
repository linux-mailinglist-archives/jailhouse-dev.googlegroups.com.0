Return-Path: <jailhouse-dev+bncBCQYDA7264GRBAUSU3XAKGQEYYYZW2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63b.google.com (mail-pl1-x63b.google.com [IPv6:2607:f8b0:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E636F7885
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 17:15:01 +0100 (CET)
Received: by mail-pl1-x63b.google.com with SMTP id b3sf3389217plz.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 08:15:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573488899; cv=pass;
        d=google.com; s=arc-20160816;
        b=r+3mpu15UBUu0upojtA8R1HNEG0mvdvzVt90cTUkJ80fmz9W3kel9lufT9HtAhfBT8
         6qppSj8PiKxfWurDkP3sXt6PKoOj1f9RdAI7uEGkQslbPSNh0W5kRYElqL1s8svtVZwA
         CaUpXUjnnNx4v/NBxu/9oP5Xh90tC0B2UODxEEw2sjx528Hpt6vIfqX4BDYVKfl4fyBi
         6aFIPS1QBxMIcSoSj24BLFFqtTzS4g/KlrpBcn+GNsqjypef7QK6ZoVpkgpZSN25f/kC
         amWkJDRF0syaSszU/dipRSpi/9qiC9ow6i2C7+Te2iHwrVTd0KlKxtJU5eXdJsH+59SD
         EGkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=HGPW4tgUYXAFydf/mfLtQ+6Ab+dZ8S/znCf7WtfeKUo=;
        b=kr04sNewP4/rzXK2VmuhTSKwDD0GaLgux/wavMy9cImFJAvkg0Pg90/Xb25l46sdtW
         ydYPPAWlFpKEdo5WUg4lTxHI1brsIC0rUGba9V1OAJlfWmiyEJthl3h/rNovF8ZxKZlG
         vi4C4tBlVlSi6u2WGAYt9gxUi97qOWPbboUnOGKwzHr/Uy1IR8HVf2KCOyRw2NcI9ke0
         SjaQLoqrKhktrgfh1CsPhc0cuGlH/Feu1lqGy9JDi5CyuGnm+gueQSnaIf4IkCC8RNyg
         3wWls0tOa5dCgbO5KkCeBqZIzlOD4RdnBTMIreFUEJtFFPBgcKrfinNLW/zO03rA7eFE
         bo7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GvjucXdM;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-transfer-encoding:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HGPW4tgUYXAFydf/mfLtQ+6Ab+dZ8S/znCf7WtfeKUo=;
        b=RrjedYyfL0MCphA6TSa7Vb7NFulLU1k6e31/GkRYAiWE3P9igY/iVaKH1vvranZdiA
         LBoVKEsJiwdJWL7kgM/As5l/HlZfGoPnNJJPbx8r+v6ZMD3jTST+VULfaUcPkJTmE+9l
         X4ASPc/u/mXYcD33/0cnB1tDtjoUco+YW6u5OTk09In/gB8OPbga2ShdqSHIKbFsYcqn
         yStRCxjHfzYcXdY4TWZw5h/R1ztmVKDkvuyDm1EfjK6YVkuFxjcS2fT5cn8LPi5Lcxb6
         tsEMBfGz38Jomnd6PVKlZnQ+uKmCR++txj+5eE4vpDkAL2ussl62CSELzzmlWR6JdceE
         Go5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-transfer-encoding
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HGPW4tgUYXAFydf/mfLtQ+6Ab+dZ8S/znCf7WtfeKUo=;
        b=cBrqgvaCw47RKPSOjBdaEgKErk2cOI4ZP9TH9d4Ro1+4NonR/RYGn6HevotOPfgq4T
         4Xz/Vy1R3n5rvAbNiceAKNS7WecS9drR7/8Mm7iNFfJIPKkAWVGNJpbWTRyTz5vPBvwg
         tvBSuylUs9cipYvyzdjMxAHllpc3WV9pZsARCnnQDZrSicftyjwFBRfaN9rucNgWhmhY
         la2xLVUm+aSKqdNgEZARViySPk0EbS2YpHxxjHYBLIGl8JxaRzAGEe5PQa1mIncZ76s2
         KTovd2Aj1r9dOCeqJqD0bI1Zpiz14G2Bg5t3W5HbDT3nHtTifAc9Ay2dOITDc5cXp5DB
         fUnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXAzOH0ELtO94ix+M2y8P61YquCZvgNaSNUAhqU1xrELKgvNcfT
	rK9JWXqTN0QZ6wfaFuSvb4g=
X-Google-Smtp-Source: APXvYqxEpbTcPm1Q7bQy1eeeKR58FA522zEUPHlNBarn1d/hfxRtWiOhQJeGcAW9dgLbIm7WUNr8UQ==
X-Received: by 2002:a63:2f47:: with SMTP id v68mr30698936pgv.239.1573488899345;
        Mon, 11 Nov 2019 08:14:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:b30b:: with SMTP id d11ls4890978pjr.1.gmail; Mon, 11
 Nov 2019 08:14:58 -0800 (PST)
X-Received: by 2002:a17:90a:6d27:: with SMTP id z36mr35817715pjj.38.1573488898487;
        Mon, 11 Nov 2019 08:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573488898; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8uC1q3ipMtv/o5SQCWAsS19judc3iYDTsTEfjRN9z5waYmjqmIMVE2/DZLCiSWTKS
         vmx4a1oul9XIM/w8pP8bGZgqIayFoMdS/QyMMa52XTuRkEqlTGmaBHP5SF58MJyiSn+F
         zMJOHlp3U05/jlzLcwt95Y0db2lxkfq4y2EivW0HZRxAnV06uw3ZPLMC//lB08KVCB5C
         1dljsVDaAfTWgkPTXzY0gS4XSR/kmLTk/ZmmleSU5mgGToy9gnaRiSthIH8E87pqh1c7
         nHjxFt2z//ec3RTuVWnaZsIo3cmwat+vYb9ELPTrZGGR+OMtwoAc5UKwro0V2J0HvTTp
         gWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=OBvWUDiYu62j00yT/+fqATyx7dX8irN1FgZbalznWX0=;
        b=D77yiill574O20QU8WOxfkUw3/vPg46r1921flTl6mCT7HyEZ25tzb+7TZEkGolWsX
         5dy8C7/0uzVdSm+58qbKzUrCjO1JuBUQj7JX9WXXGewyAC9o8h/KNDXgEOcI/UkfKcQc
         fYAi5ZaU2ljvcZ/W3BCp/9zjpyUT5lIVueQbohWIipujLeuLV2jz3jUY8MrKernqqWwY
         PZRotHPQo/i+yAS9pe/k9+LiOMAJQRT12pMlznNBrMa0xR6hKxwtiqHtaGq1rPnDiaCr
         GaNWjZ/GqQiI52ZvU/6Ub0mbt4rTJhmOn8fpwvQnsIdlchKsv+YWEeQkRyYVeiJDLbWl
         poBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GvjucXdM;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by gmr-mx.google.com with ESMTPS id f19si427039plj.1.2019.11.11.08.14.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 08:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-ZGrEh0WiMaqbdwoqcGxTXg-1; Mon, 11 Nov 2019 11:14:56 -0500
Received: by mail-qv1-f71.google.com with SMTP id 41so6583330qvw.5
        for <jailhouse-dev@googlegroups.com>; Mon, 11 Nov 2019 08:14:56 -0800 (PST)
X-Received: by 2002:a37:9e05:: with SMTP id h5mr1318608qke.76.1573488895894;
        Mon, 11 Nov 2019 08:14:55 -0800 (PST)
X-Received: by 2002:a37:9e05:: with SMTP id h5mr1318577qke.76.1573488895606;
        Mon, 11 Nov 2019 08:14:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
        by smtp.gmail.com with ESMTPSA id x65sm7787226qkd.15.2019.11.11.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 08:14:54 -0800 (PST)
Date: Mon, 11 Nov 2019 11:14:49 -0500
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
Message-ID: <20191111111203-mutt-send-email-mst@kernel.org>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
 <20191111100607-mutt-send-email-mst@kernel.org>
 <20191111152743.GM814211@redhat.com>
 <129c527c-1e61-8c0c-3ca1-fe93e26c8bd2@siemens.com>
MIME-Version: 1.0
In-Reply-To: <129c527c-1e61-8c0c-3ca1-fe93e26c8bd2@siemens.com>
X-MC-Unique: ZGrEh0WiMaqbdwoqcGxTXg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=GvjucXdM;
       spf=pass (google.com: domain of mst@redhat.com designates
 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
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

On Mon, Nov 11, 2019 at 04:42:52PM +0100, Jan Kiszka wrote:
> On 11.11.19 16:27, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
> > > > On 11.11.19 14:45, Michael S. Tsirkin wrote:
> > > > > On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> > > > > > +| Offset | Register               | Content                   =
                           |
> > > > > > +|-------:|:-----------------------|:--------------------------=
---------------------------|
> > > > > > +|    00h | Vendor ID              | 1AF4h                     =
                           |
> > > > > > +|    02h | Device ID              | 1110h                     =
                           |
> > > > >=20
> > > > > Given it's a virtio vendor ID, please reserve a device ID
> > > > > with the virtio TC.
> > > >=20
> > > > Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this =
finally
> > > > official.
> > > >=20
> > >=20
> > > And I guess we will just mark it reserved or something right?
> > > Since at least IVSHMEM 1 isn't a virtio device.
> > > And will you be reusing same ID for IVSHMEM 2 or a new one?
> >=20
> > 1110h isn't under either of the virtio PCI device ID allowed ranges
> > according to the spec:
> >=20
> >    "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
> >     ID 0x1000 through 0x107F inclusive is a virtio device.
> >     ...
> >     Additionally, devices MAY utilize a Transitional PCI Device
> >     ID range, 0x1000 to 0x103F depending on the device type. "
> >=20
> > So there's no need to reserve 0x1110h from the virtio spec POV.
>=20
> Indeed.
>=20
> >=20
> > I have, however, ensured it is assigned to ivshmem from POV of
> > Red Hat's own internal tracking of allocated device IDs, under
> > its vendor ID.
> >=20
> > If ivshmem 2 is now a virtio device, then it is a good thing that
> > it will get a new/different PCI device ID, to show that it is not
> > compatible with the old device impl.
>=20
> At this stage, it is just a PCI device that may be used in combination wi=
th
> virtio (stacked on top), but it is not designed like a normal virtio (PCI=
)
> device. That's because it lacks many properties of regular virtio devices=
,
> like queues.
>=20
> So, if such a device could be come part of the virtio spec, it would be
> separate from the rest, and having an ID from the regular range would lik=
ely
> not be helpful in this regard.
>=20
> Jan

I agree it needs a separate ID not from the regular range.
It's a distinct transport.
Maybe even a distinct vendor ID - we could easily get another one
if needed.

> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20191111111203-mutt-send-email-mst%40kernel.org.
