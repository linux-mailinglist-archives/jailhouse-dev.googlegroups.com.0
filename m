Return-Path: <jailhouse-dev+bncBCQYDA7264GRBFFJ7P4AKGQEENL3BRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C422ED0A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 15:20:22 +0200 (CEST)
Received: by mail-pg1-x539.google.com with SMTP id 75sf12657779pga.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 06:20:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595856021; cv=pass;
        d=google.com; s=arc-20160816;
        b=mTpxZfcLcR2qkvoatv9hznlCbyTmcbJO0tSnFug/9DbJTpVObUPe77pti3X4q46nxN
         HvjJwqeAFxiiQRSPmtW3qVg/kUMTKwAaiRXok/ZGLt3i7VKLa5t/ULhtMxVD1w2o4VZg
         9UazPAXMPA/lSiXMLp10asCxPWIhyq3yNhBqtWMoeNgaUjwqhEQkInAW+FSuIxxIvpqR
         4YUQyqrjwnCxNjJA9b2WiTVIhY+2xuqvBkCT3p0pbcOG7Z79VEe5g8w8kBKdhEK60X8Y
         U4aChkzpVeQZCqiwLQuRB/M6XSQuVS6b8hhhgS+GDQJPb+njwJHrbtR/1bFHH+jXKC92
         azXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=WDSbUi9Ki2wIZ0JekBwNgQuF/rnfpYgzLuC8LQzMr7I=;
        b=GlL4UJByaoODExvATY9GqXC957YLTNnF5JK+eedmBUFJikGBEFrpLJJJt0Jsf5/GKb
         d7YbKLMh5VLpohIRZdVPFibZrNb7zEQD1zCKtlVLGLu/7mSjbd9fPtjAzpckcQYoOjE6
         JFvMHBZ5Qt4n3stFmEAlgLQNhk0WBBrlctzo6Ys4Z71JqpBCa1ROTJFh3BpN8+UhBiT9
         djgdWkOvcdwXxXYRZ5jOIym4jdrF6GM+cGIfSbtEBgQgPXF0FOLtDsKLHimeuIF4S5vL
         JY5QGTbWhvAi27BFut2MfnxyXmzeOcbTR/0S+lf/Ux73luZ5ONTMVgv0t508VjzNSCNh
         lgYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RzaFFBGV;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WDSbUi9Ki2wIZ0JekBwNgQuF/rnfpYgzLuC8LQzMr7I=;
        b=nNPlXz+kkj7YiAI/pTUyI5phHQz46PgfVvWUFAxNAj3k2iuddAOVjxoPGyvlG3uz2k
         EdLv5D8xb5QXcpAnEepdjFwFW4g0PGeCGaTyq2/c02ouebaUBh7a6MyHKtgzAMIyatQG
         u+hE0GEXGGqroTIQp7KBiuw/mT8iLsRc8zAeRx76F+YsfSYsciy3h1tIGEE7hkSQmh+J
         lNJZ7heUzn5gYdEg+LhtHGqntUweoRV4w2ct6x2r93KUvWcqRsl7+etltwe58qxU4VQa
         QlhyCm9XavOSEoDxXb4TyR+Yf3pRudWCfhBuUEF0QZ7FDlVXt/7u+ZM7rpTzcZAEtIx4
         i98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WDSbUi9Ki2wIZ0JekBwNgQuF/rnfpYgzLuC8LQzMr7I=;
        b=nVOHAf3wK1nNkipQ13WFwQZtMerEwOoulQP1XT1Ry+hMM/deA0rDP4FPUcZStKiESn
         SZ3uN4Rh4YfPJ/iN3zshd+GNjRCl3T8JkKa35Gpc3PFwowmBOimAlP9+auhof22JoMs0
         EfALgnYAJzsM8Gun1gEhwZH0JjLHT7uj2vBlwTMsdlpRxzmUi1AJmjhHZoKSPb6WUq7l
         iUl7Jkr3lWP+4XdmfSv+jU4c+GtLKDCb4MPDrq6dufZYEIdX3DWqp5hCWTDme1IHmxD/
         h3p8JR9fGXJEut/AwdVJCdDFWsl5C8CDkKCeaTX/t+I0v7Jxbrp2h7EO70FhRz5ol/NU
         pW3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530foWYQ0MRh3N66dzdn6ZNYY9qelEMvpL/wPiLixePLRgBafVNC
	A+/KM+40Vi5VHK3SJjdxLpA=
X-Google-Smtp-Source: ABdhPJyJruxN3nTbpNqeoe9USx6XrCnfdbxoRmAW/VZse60Vjz+3g5vdDXfFbkYuYEe+QYvoaupmJw==
X-Received: by 2002:a17:902:7e01:: with SMTP id b1mr19296988plm.310.1595856021139;
        Mon, 27 Jul 2020 06:20:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:684d:: with SMTP id q13ls4683696pgt.2.gmail; Mon, 27 Jul
 2020 06:20:20 -0700 (PDT)
X-Received: by 2002:a62:7c4f:: with SMTP id x76mr5328463pfc.124.1595856020458;
        Mon, 27 Jul 2020 06:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595856020; cv=none;
        d=google.com; s=arc-20160816;
        b=sk0Q/fb++qfAlqbFNqAXFmkRfOzibnJ3wx+hsHbg0jNrtAizKFlLucAp1/wrGACwjE
         /H7ifgtnSnkBl2bQV9UD8OJVp9+HE5DU+5f9PRnPTmDjrjIxfSEmFpi/xUAVeWBnx9nI
         c5a1tiJWDju1RaD0ssRVtpYJFBmtLzF9ZuctlykF75TpTYwRzxKZUTlANfwXxgUcVtLd
         uJBc2P/w1UJ3s8qmrxukiEOhba8jm3tTYf+we40zYPu0LNQnj5knL1FZyY/kq1ozL+2H
         giWvlv4JEqVzoBPMVp5y0vuZODGGhxKV3rToNn6vfRVA3mRGWzJtVtY+ucd8Cd4qDHXM
         nh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jrcXXs1yEh3OOU7gsBHcqIm2H/mCao8DCc7NJB9MyZo=;
        b=ME2Wj6p47sNS8zjBzJqZ2g3aGyxczMCm61ftYIBg25CIGYBBkte0mXXCYObUmwXv0u
         5QyjlZvGsl0XQgz67vGC7PWfNVnpchRss98fRzukapwKrawsv6aPwi2Jj2nCFZMX3I/S
         yffPpjBmo9/xvHGHj8n+u3xLNKupFOXnINE6ZOdKp3xgaLDwC24g/Rf0g4uH/HyUQxA8
         KErHPMCOfz2YZU/MIDsyi47JoD8swhxZ/wCLa7tgcb0dAGH3i5z+6kexnBXV2afJEQ45
         YFeKhLFNI1lrBDoejviQVi4L25Cq0HAnX4OoqC18c6tZZSlGXMJ+iE8SqP5/HjjNb0XZ
         tLyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RzaFFBGV;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by gmr-mx.google.com with ESMTPS id n136si743252pfd.1.2020.07.27.06.20.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-R8NZF_NBMSyZldr1x11tRQ-1; Mon, 27 Jul 2020 09:20:17 -0400
X-MC-Unique: R8NZF_NBMSyZldr1x11tRQ-1
Received: by mail-wm1-f69.google.com with SMTP id b13so7816054wme.9
        for <jailhouse-dev@googlegroups.com>; Mon, 27 Jul 2020 06:20:17 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr19561175wrw.105.1595856013020;
        Mon, 27 Jul 2020 06:20:13 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr19561146wrw.105.1595856012762;
        Mon, 27 Jul 2020 06:20:12 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
        by smtp.gmail.com with ESMTPSA id t202sm18264236wmt.20.2020.07.27.06.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 06:20:12 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:20:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	liang yan <lyan@suse.com>
Subject: Re: [RFC] ivshmem v2: Shared memory device specification
Message-ID: <20200727091802-mutt-send-email-mst@kernel.org>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
MIME-Version: 1.0
In-Reply-To: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=RzaFFBGV;
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

On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> #### Vendor Specific Capability (ID 09h)
> 
> This capability must always be present.
> 
> | Offset | Register            | Content                                        |
> |-------:|:--------------------|:-----------------------------------------------|
> |    00h | ID                  | 09h                                            |
> |    01h | Next Capability     | Pointer to next capability or 00h              |
> |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
> |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
> |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
> |    04h | State Table Size    | 32-bit size of read-only State Table           |
> |    08h | R/W Section Size    | 64-bit size of common read/write section       |
> |    10h | Output Section Size | 64-bit size of output sections                 |
> |    18h | Base Address        | optional: 64-bit base address of shared memory |
> 
> All registers are read-only. Writes are ignored, except to bit 0 of
> the Privileged Control register.


Is there value in making this follow the virtio vendor-specific
capability format? That will cost several extra bytes - do you envision
having many of these in the config space?
Also, do we want to define an extended capability format in case this
is a pci extended capability?

-- 
MST

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200727091802-mutt-send-email-mst%40kernel.org.
