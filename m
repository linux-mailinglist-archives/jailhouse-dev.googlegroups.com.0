Return-Path: <jailhouse-dev+bncBCU2J6WD2UORB773UXXAKGQEKOBSUBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id D5802F77A5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 16:28:00 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id m12sf6471467qvv.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 07:28:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573486079; cv=pass;
        d=google.com; s=arc-20160816;
        b=YI0re+AfRDDGgYUl7ACOlWkIyGac3xKNXFbVTBYIUyWPX/1XBtE38B2CGw1rfA1lnj
         9dZE5stBXGiC839jlUKomUTNOQ3sq9K8mmV91cpPW0c0SKFin+efta7C8TEZbKQ46U7R
         v3atDmyYxlCVcRo3Wg6bBvx4uyoZRctGLK9uExMH6Pp/Uwfz5FUDxWdKCrj4H5sJrzR5
         EsxH01A4+pROzlBaS7zguTWx/QjQkBlSQEaXD5F/d9QNKgVGkRS3bwwxynEPDlCxD1sG
         Iv/DzXoLKgBx4CMrP8Sryoy2UNxdpLBd2zSotPY0X6PG9K4qshOHpisKJMigF3oy1iyX
         BadQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=4ekZotmvk12R8pRj2QKvWSOOOSAUUjf0RfuhPSaGLG8=;
        b=Y9zygFMslpNR++53C1y8JMcAFFdZ7HTAsmT8Xnpblz84yUyTIrxoYgl/5y1UuUjgkB
         4tU9tgWaLFWYOMp05D3qBht9htm83NVqZDQ8VhCItJAIqgio9TqFRJrnrxc1F0bR0xX0
         +OZ4oRNUIo/fJMUInxOlDFo1ml2Gx11tkKshhF7UFpWLrvUeCPF1FoTtewt16AvMP3gz
         DMGbz8nRASiQFQd+ftLUwpdU74l9zbZsZ/mvip2iESVmkN/c7hplJFCTpnVNmF0tirsL
         Jvutz/DRJYZlRx00o9yq4LMUahGZbb1Jqk54ejodOPYbIYH8PV6wgkCl5fdGy2cDVuNb
         GEkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJzsvr3n;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:in-reply-to:user-agent:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4ekZotmvk12R8pRj2QKvWSOOOSAUUjf0RfuhPSaGLG8=;
        b=AVL0JvWvPJtPw1kgWfvQYW4oW0pl6cKMHuHinDEW7tqq5Et8DJ+SsuVNGbzX8QfEwm
         zlcIHqKSWzlDVAqfmsWYEUGY/Z/HZqhn1mZCj9wrlpz3Cg3n109lMs/7ST3Juqy4+p+5
         u1XDsvz1fp1e2BfNCA2NYMXUuAlN9odcFN/kHOmCmvu6waF3W4X9ntaxrQ9MRuNCsbL/
         wsRwa99h7QO2RaWLXa7RINxSInXd3N2y3HuNp6uQGT0Wm3KlUiLnXAZyexW1epEriFVO
         QW8e95se7m5XyMYGOcR5/N/0WQjh02DT2BwifS7rf+rXjjvEWZSrrsCjJZklDaLYVRQP
         IEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:in-reply-to:user-agent
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4ekZotmvk12R8pRj2QKvWSOOOSAUUjf0RfuhPSaGLG8=;
        b=LN5fcGM/dwFq4ujGRwz+agVaexfiZqayKlaMPGxD0H5DiFRv2ZKN60TRiewBVlbNWo
         5D7aJn9FE1DhICHDwEQIVdXL7UkBg8O6fZGty+A2t9fJ2K0pP08QWbFe2WbP1Wsxq5YW
         e7BxfjUT5fBKdUdrLD+H063PJfVfQG6TaIFk+HcX73UbEq67Xl+TFmgLZ7SqL1D0xFPd
         t2B+y6brXwP7JVp2Awx+UsDjqA6du6DhbC6Jg19rQ+xAkl6rb84a2NvFj6ZoGT8WnKSk
         eUbvajoJbYwDeYDs3tRSksDY3dYaFob9XwE5pyUVIA9ThdhGaSnnG70pXf07h8S6FlIX
         WOPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXP2YGp75w1XhJbcCkByjQHjxd4tb82utPiA/outOLgrNwGF6xW
	rnSnd97zpETL/A6JYUXhNak=
X-Google-Smtp-Source: APXvYqwQpwHgUhPORgXitvsUiAfinYvasKEhRKyaiCvdklovF5IaDbe1cO4pvu68shLbEA153QTD5w==
X-Received: by 2002:ac8:2fba:: with SMTP id l55mr27167649qta.167.1573486079646;
        Mon, 11 Nov 2019 07:27:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:85c1:: with SMTP id h184ls2078297qkd.3.gmail; Mon, 11
 Nov 2019 07:27:59 -0800 (PST)
X-Received: by 2002:a05:620a:12b2:: with SMTP id x18mr11201320qki.437.1573486079129;
        Mon, 11 Nov 2019 07:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573486079; cv=none;
        d=google.com; s=arc-20160816;
        b=mWXwN8+82a22ar0bB6oQZaBnmtMZMvE3PriPb9jKK3436kuBuPAckGDTC75KwYLPGo
         pkZrMKE68S2ZD41BziVziuuBuZXbjeqXi7HMKsuxtsfHjSxGq9l4SrwbUcRWCEZi3Q0j
         tyhfl3+FokuDpzdxU/xQJ85e8Q/znJ5ns0RDqeg19pieR8f4BlZi8NEV3dn0nS8XwrlM
         TDihNx3LX6mc4VJT4If3c7TGJwW5zisgqS0P6CQhqQQ0yAtBWaoJ4+QZdQmRa46EeCyL
         AgbAuCSZicjoqjwdivHFTu7lRFgTSJiukb+cj+X70X4Zw02rpGSkQgwOUkFx63OyBmwn
         xpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=hZUpsan7ynawPn4cZlERvm27mWsq78DDG0gqXnnrob8=;
        b=zQeY0tsPPbkYsfuFqsDbHrHtLkJJ5NItM5yZc0iuyoN5JYQOlJrrDGejQimEMEwngS
         C4lQ5w9MaO6Gw7e1XrVVmytfCukPOaScLE/yvz13QWAYHPY8NDcdhlMzKERj5w0/rNEA
         bUu+IZIkM8aXs7tQ/BhKC2VdaaVlAOnuapX+lb5oJefeqlJOFxB2MEp6f9YjBEF0GL7B
         J4z0MWcEx2alDMdwDc/HBs+RZgGWrQoYzkp5RkFcTNKgRAYHB8t+QS+xGxMysDX98eJS
         u+JR3MSQt+JGfOTNjP1gsrRkp/E3mS2CuHaV3OOLP14lqJqeR8HsRta5j42h60cFT0WY
         Quow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJzsvr3n;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by gmr-mx.google.com with ESMTPS id w140si933567qka.6.2019.11.11.07.27.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 07:27:59 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-kNwO3cPvP4G4TGyclD_Uhg-1; Mon, 11 Nov 2019 10:27:55 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79471106BB8C;
	Mon, 11 Nov 2019 15:27:54 +0000 (UTC)
Received: from redhat.com (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9878C5D9C9;
	Mon, 11 Nov 2019 15:27:46 +0000 (UTC)
Date: Mon, 11 Nov 2019 15:27:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, liang yan <lyan@suse.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	Claudio Fontana <claudio.fontana@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
Message-ID: <20191111152743.GM814211@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
 <20191111100607-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191111100607-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: kNwO3cPvP4G4TGyclD_Uhg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: berrange@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=CJzsvr3n;
       spf=pass (google.com: domain of berrange@redhat.com designates
 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
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

On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
> On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
> > On 11.11.19 14:45, Michael S. Tsirkin wrote:
> > > On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> > > > +| Offset | Register               | Content                                              |
> > > > +|-------:|:-----------------------|:-----------------------------------------------------|
> > > > +|    00h | Vendor ID              | 1AF4h                                                |
> > > > +|    02h | Device ID              | 1110h                                                |
> > > 
> > > Given it's a virtio vendor ID, please reserve a device ID
> > > with the virtio TC.
> > 
> > Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this finally
> > official.
> > 
> 
> And I guess we will just mark it reserved or something right?
> Since at least IVSHMEM 1 isn't a virtio device.
> And will you be reusing same ID for IVSHMEM 2 or a new one?

1110h isn't under either of the virtio PCI device ID allowed ranges
according to the spec:

  "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
   ID 0x1000 through 0x107F inclusive is a virtio device.
   ...
   Additionally, devices MAY utilize a Transitional PCI Device 
   ID range, 0x1000 to 0x103F depending on the device type. "

So there's no need to reserve 0x1110h from the virtio spec POV.

I have, however, ensured it is assigned to ivshmem from POV of
Red Hat's own internal tracking of allocated device IDs, under
its vendor ID.

If ivshmem 2 is now a virtio device, then it is a good thing that
it will get a new/different PCI device ID, to show that it is not
compatible with the old device impl.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191111152743.GM814211%40redhat.com.
