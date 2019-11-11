Return-Path: <jailhouse-dev+bncBCQYDA7264GRBEOMUXXAKGQEBATX44Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43d.google.com (mail-pf1-x43d.google.com [IPv6:2607:f8b0:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 90739F7543
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 14:45:55 +0100 (CET)
Received: by mail-pf1-x43d.google.com with SMTP id i11sf12701764pfk.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 05:45:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573479954; cv=pass;
        d=google.com; s=arc-20160816;
        b=yYCILwu7xYK0+269baamte9yN9Qvnawg8wv+WgtKTbwRwlbtmcdT/lKHL0Z/eJCl7E
         Rt6CWFaw7AR7D5tpveSZJAdWKCH5ttr5a5sKfdHEG69q87k6bMMKPQyOBKboyWYCoYyp
         8r0++ILBeAR0GxWYkPHZsrWtR/9K1IMlqYHa7kgYYWvU0BEJAdmlbnpRyi5YJ/M8mPjr
         abn7QAYW5qpT/h0OYgphg5XHJsdbv6cdLJB0urnodCRkc/wI7RAcWsb3YhzxC3R2eInO
         f10bsgdCzV6ztQnfKcBajSE9pqS8n7UU5z2FxXoHFQp5EuCLIfEbBX6/qHlND85IJMzm
         6uQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=yYxFDQEB8Ugou/U01VMXhVnURX6lhLEs0pP2J2argPg=;
        b=GrkKzaDV8LG40qaNbyWR5lcEbRrtf3C+yh+6D5DHtldJAPga4VcPzAgmX7Iju1a8AQ
         adeAjf0Zcbwyp6OL/24pDjUK0sOy0Yobd6mRojxwGKdbtRCvFswI+SvsTDO4FZrWWeNQ
         QnfHoqmypX5dl7aDfekgX9gRcwGVMwIbgct/do4TqI2IL4C6YZ/VwqMHflGN66u2RvUY
         viZ/iERiVA2XVH66hgMIEbYCJoAUkC3CntrQ3oZrevymD4g0N7yFoTadG/qX26UnIj0Q
         sThWPkTwx0mC/EwZDFrCRwjtJu4YjQRE/563U8qQ5CBubnD5tzVD3AYStgXsv77cC602
         W99w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QKRt1tBY;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yYxFDQEB8Ugou/U01VMXhVnURX6lhLEs0pP2J2argPg=;
        b=oLX4H0NJb77SOOlCp3jvg3UB5LYwmetEA82T1jR2eLpooEDnSXeQDmuhO1EoxrbPZK
         LGu80OGlQ3x66JT3uwYI9h7r/vbyA5jPg2CfLC0VvUyke3swTwu8stcVOIZi3b7FvPFF
         Xl2Abf6b79j9RkkVMNkjfV9hluAzMVTWYN4NUPQVtVmbd/xYelJDjh/hhlg8+P8M7fCI
         Hicv/yAxBNe9Mj3735uTsa2gwuMpdACveEQvobISAO/Penud1g/MFIPC+uKpnNoew7+A
         HCJ7s496rk1VCMeN13rHVY7sJwe0VBpim6WunC3H4KQntrb3kiPSM3qDJTElavQ4qJml
         FslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yYxFDQEB8Ugou/U01VMXhVnURX6lhLEs0pP2J2argPg=;
        b=OyKC/ZhiMeHT5daWjJ0Ma80BQod+2DtiAPq882NUoht/jM+w9CWGjsIe57f4y4CYAZ
         jiRBMBO4EJs1hY22HKJDVYs9XdFNd4o4etFTU8z4vqnhParRJeOyw3SI3px6V2lVeI7a
         R0wKAssH58KUs/GaIquievEZdfT33h9m82DJFTClvCW1EbdkC2+hIhRYGn8lzxKgtjrN
         F7rSMIH6tSQNHrCGsXh+MyM1M2MwZ4jfHO2xdat4m7PInR3rfgwLWQV86aFtqqFnGVnL
         TzMmS83OnNXkzgz6cnw6Teqay0tthAw5uZvtSm989nDv8s64TJ/5Zt999o4ZRIZlIKI4
         QFUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUv08I+sgt/6N2tEuoYHEdEQG0RS2hrXsCTTPMMtuvh2wyL7DeV
	6nsrelGV0CWENrHkpXX0A9w=
X-Google-Smtp-Source: APXvYqyaUXijUTvEhhKx03qD+Qc4vul8ZYJ0Au1usOt05+0gIzkN9fvBwyBV4s+48sns0vPaKYGjPA==
X-Received: by 2002:a17:902:20b:: with SMTP id 11mr25812495plc.224.1573479953616;
        Mon, 11 Nov 2019 05:45:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:52d1:: with SMTP id g200ls1828117pfb.3.gmail; Mon, 11
 Nov 2019 05:45:53 -0800 (PST)
X-Received: by 2002:a63:fe09:: with SMTP id p9mr28620094pgh.293.1573479952894;
        Mon, 11 Nov 2019 05:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573479952; cv=none;
        d=google.com; s=arc-20160816;
        b=yV6H5UaNs03+ww6XaK9CWTXRgdkP+okG59b+R1RpYkWMX+eKHK//jBLAcTXgOLNy6X
         uMbD3ZSyI49lgP/jzB7x4dKFOpxbZtguPPRnz7iTiFCSTGtkxVk2GFSxm/ofdgbI0TWn
         l7yt1m+SIQCajyve2ApyB0pnQVtFH/YktQ/aX4LP0p1F3POhgtTgMEwpHA1Kzkg9HX8N
         Bu3gKyLtq5GaP1MLb0H2zhl4P9HvNa8J+GrEpTRz0Lc/544gHyTtWa6JYTA7uVBgFqQY
         PmWiA0xFEk92905vFrn81+iXzfjhbEv7kEcmW7Km5HEpBLE+PC2t7WP4jH9BuMSlqajG
         scHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ARhPkn31aPnd0ZWeUIBEWQhmx3DRB25VIXrq+KL1tmk=;
        b=HWEzDwehZ2IYL5Pg+IyTvCNRVRou4W2dXzumoF/33OTt3GVVa/4UL2WMdyddoKgXvS
         EcjND9oQfVYIJ9vBEDPlwHMLXjx4H8Ua3P8HIUYzeN/mXlSEe2CDedwc6XeANcB5IMzF
         aBuvG5ubkkxyh/aoxCjO5OPjL1yy3jQXqS3Qd6QaeHhsxOivA50rK3zJF0/kFuEqU4gN
         hGNEFA8l+2AAIrCp7747jWjZ4LDTRj0ruAHWzb4tp4f9QxKgwsu6reOIcZ050wSCArgU
         BxwbMD7AmBAAzjytYZGjUtqGGemclj+UPUEAsXWQg7et12ib4EkwEG4g84RlmNtArpzj
         bP9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QKRt1tBY;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by gmr-mx.google.com with ESMTPS id 102si209697plb.3.2019.11.11.05.45.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 05:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-QkmD7X0KPESFseVgwEc9iA-1; Mon, 11 Nov 2019 08:45:48 -0500
Received: by mail-qt1-f199.google.com with SMTP id e2so13378207qtq.11
        for <jailhouse-dev@googlegroups.com>; Mon, 11 Nov 2019 05:45:48 -0800 (PST)
X-Received: by 2002:a37:62c6:: with SMTP id w189mr9665856qkb.48.1573479948561;
        Mon, 11 Nov 2019 05:45:48 -0800 (PST)
X-Received: by 2002:a37:62c6:: with SMTP id w189mr9665835qkb.48.1573479948294;
        Mon, 11 Nov 2019 05:45:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
        by smtp.gmail.com with ESMTPSA id a7sm2472310qka.136.2019.11.11.05.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:45:47 -0800 (PST)
Date: Mon, 11 Nov 2019 08:45:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <claudio.fontana@gmail.com>,
	liang yan <lyan@suse.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
Message-ID: <20191111084327-mutt-send-email-mst@kernel.org>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
In-Reply-To: <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
X-MC-Unique: QkmD7X0KPESFseVgwEc9iA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=QKRt1tBY;
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

On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> +| Offset | Register               | Content                                              |
> +|-------:|:-----------------------|:-----------------------------------------------------|
> +|    00h | Vendor ID              | 1AF4h                                                |
> +|    02h | Device ID              | 1110h                                                |

Given it's a virtio vendor ID, please reserve a device ID
with the virtio TC.

Thanks!

-- 
MST

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191111084327-mutt-send-email-mst%40kernel.org.
