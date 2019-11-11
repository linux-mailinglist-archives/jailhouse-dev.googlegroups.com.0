Return-Path: <jailhouse-dev+bncBCQYDA7264GRB3HSUXXAKGQE4E5K3WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd38.google.com (mail-io1-xd38.google.com [IPv6:2607:f8b0:4864:20::d38])
	by mail.lfdr.de (Postfix) with ESMTPS id 17824F7763
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 16:08:30 +0100 (CET)
Received: by mail-io1-xd38.google.com with SMTP id q4sf12844451ion.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 07:08:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573484908; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y94hBWoYBcg8s9JRpuD4cXHLN8JvlFEcyu+h7gPQogQrjZojd/LnVeKQ3TtaioT88J
         AZUkU66rgC7x7UUsojN356JwDlLaAqvQtcYK5WFB7gFKBDfExI6hVcSfK6J15segqdm7
         rnG12mnKZ8y1dMB8bYX/IrCeGVtRNfYqyvX8GU33nz6YhmPBXTsZ3HqznuCUBWcvYV/w
         3qpzcfd6lz2nVj/bKBGrqC/aEkh9qg5PsuWc/y+E/iOombd+tEx8Sddl+fqswsEZgz34
         wi89p+pfQ/GFWIYyREjqUb6WL6l25U4khP7OA5kJ2r/uM8HLVV9vw2KtAQYeTfK4J19Y
         73zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=z+i7nrXxO0omhcSjX3nZmrwsDFwLfpq1hfvrjy/fS6g=;
        b=lo3MCHzBCq9OkJCSjCNSXAoJB5EWZZ0iZnV+rCN+dN2kV6vII8QccfP2oVTotIGd5s
         pzrYwv7yiLnikGqLveZXw6dYqEZkZsmJAJQYJyX0P3XGhr+ay0DMD7cHnESaUHfE3NhJ
         KILJ4uB1XhBlCCV2nS5BWL24yX//jgl1xOv8mT7wjcdY91dqXevk6Q6boG7Gdh/o1XGr
         O/D79lC/jw2kXYK0JrYCauXUir693EbgpT0MwNAxX9euqdsdsrfTh86wYiTK9fJHpg+S
         Ne1XdAhVxelguyUeUnPtX21CEGDF6P9Xm/QJc3HZfloeY+ftRUxBM1ZjSQYEPR9JvKTx
         nG4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JXwpIMRj;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=z+i7nrXxO0omhcSjX3nZmrwsDFwLfpq1hfvrjy/fS6g=;
        b=VpBizfaPen+wlPqgy5PvnLi6xh59Gq2zzcLKtXfqbBVj8zDEq9vVJluafAbm5pSuNZ
         uERoWzWFGIMVP5k8SNohlkmsa6hyFcvaPthiXwURzB1K3kKCzJrOtiai9pYwisp0Nxm2
         QNGn3BTFNb3Zsi5OQSkdpCgPcmMyMpcDwFs2psEdR2B0s8sT3aVH5IS/cVDOttBTUvN6
         dXVh4sL1KSfhX2e4h9qB3tPRHRXOckjslZWuiVi/osneVoeXp0keYQqXWHJNnK3uKff3
         74BFeAVRtUECVTCWH3qYOyKTnKGY0p4s8Jkd3sIMZKzJTEtB0p2NPEXTBsZqYeI7n5wm
         GM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=z+i7nrXxO0omhcSjX3nZmrwsDFwLfpq1hfvrjy/fS6g=;
        b=nM5Fnubw/yn6V0kdKHXSxaomUEgFOP3z2YHOG1S05aek5Za7iLnO+TqBKVSYNO4g/M
         zJ8HYCnShUwavHMSdhROeSKo1ppzkv4RoslydA/xChBJViBgNcZdUadG86UMYVoD9WpD
         s68ky+31wepCkXmrKQj4Cgm/vE2LXgBJPsGOm6BiLbJh4Jta9ECXqQXikRQp7Nf3utNC
         fd4m/b6crpdof5c93HlfBrIhwut2Ut05HWKuu5yWV9xU2Brqb9w3C3MMN/QUvauZbY0H
         nYiPxpJEMIa+IZ1u+uaUBueQhse2H8Uv2zepOjm7Dj+2wO0XGvfObYMd+NJpPfTWnHiV
         iFKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWsamlNaPfYZvk4pssjWy1NUYDdpfw8ZecOKHK0Yp3bYJRsaw6a
	QHgRnSf46CWnqestRKnl9zM=
X-Google-Smtp-Source: APXvYqwmggEeQRViNFEKmomvQqBvZEG5W+OKXitMfQtWoUyjUWH5W64Z0+fcsXNE38KtMSJBah4GPg==
X-Received: by 2002:a5d:8447:: with SMTP id w7mr8136794ior.127.1573484908613;
        Mon, 11 Nov 2019 07:08:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:aacf:: with SMTP id p76ls1114576ill.1.gmail; Mon, 11 Nov
 2019 07:08:28 -0800 (PST)
X-Received: by 2002:a05:6e02:d85:: with SMTP id i5mr31765890ilj.161.1573484908002;
        Mon, 11 Nov 2019 07:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573484907; cv=none;
        d=google.com; s=arc-20160816;
        b=UEIU2litbkZu63cytz1m0p4PeNjB+GrHpWhNyyNa3FTsK9ITmHQ7ln4Z8wzfnTo/FY
         AJKDCUob7Mkrl1r3bCniRaaaOkfFsq3ulyXoEbIx0/4A6AyQSwf5ObWZJujkvyIXkyzY
         ilF8A/a9YSMFz3al31yIYS7VAvUBdYFBVRkni5ig+vM3XbUwTRDz+FbFO5RjrNb5Fuvm
         +AYPHUg3sZINkZxJG11TQhtYccAhhwnLg/XlkBJxzXS85dWJby5e2UXzsnXYI+CNdOlC
         WgupTtNAA96qqc+3QIlDo0ifLwgMTctdrM00j0uQP+hA3VwZieqkbsp+//wSOtldiftV
         gTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gYtXzWtMMC+O9l0qe6hHWK83J0wOG+2EVWQX3SeIzJ8=;
        b=uSc0N5FsZeJLSvvZAZEoWgDHOkDPFHIOF43tBTURsYJOuqvqwEJdoD4VxCGQfh4Khi
         CgrMqkMPsEjIZQSzYKpP3LvpceNlaXYR6kQcsD5puib2KfUO3tS5k0gZqdJSrSHS665M
         quYUG7vsHlqKzcpKmPHFCbl/2Ko368L7oRPLVQLEcWpsFPZlMMAU8nYJgZeembxMmaYZ
         6PwmJfaVgmMm2/zqmclBDJLFUtQyF11RfDzpVRWqLQg4rH9dvY88rlgsJo1TurXH13cn
         TK/Y2xtXhZKuD668L9xu8Xk+Y3AAQUvu8mLxCo1WFodebDXSU+dspCGayZ0da6GAy3y7
         zFrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JXwpIMRj;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by gmr-mx.google.com with ESMTPS id b74si1020610ilb.1.2019.11.11.07.08.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 07:08:27 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-G__5_SiuOQmf-9huvbsX8w-1; Mon, 11 Nov 2019 10:08:26 -0500
Received: by mail-qk1-f200.google.com with SMTP id 64so7973893qkm.5
        for <jailhouse-dev@googlegroups.com>; Mon, 11 Nov 2019 07:08:26 -0800 (PST)
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr10541061qke.121.1573484906053;
        Mon, 11 Nov 2019 07:08:26 -0800 (PST)
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr10541037qke.121.1573484905854;
        Mon, 11 Nov 2019 07:08:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
        by smtp.gmail.com with ESMTPSA id 27sm12063462qtu.71.2019.11.11.07.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 07:08:25 -0800 (PST)
Date: Mon, 11 Nov 2019 10:08:20 -0500
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
Message-ID: <20191111100607-mutt-send-email-mst@kernel.org>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
MIME-Version: 1.0
In-Reply-To: <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
X-MC-Unique: G__5_SiuOQmf-9huvbsX8w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=JXwpIMRj;
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

On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
> On 11.11.19 14:45, Michael S. Tsirkin wrote:
> > On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> > > +| Offset | Register               | Content                                              |
> > > +|-------:|:-----------------------|:-----------------------------------------------------|
> > > +|    00h | Vendor ID              | 1AF4h                                                |
> > > +|    02h | Device ID              | 1110h                                                |
> > 
> > Given it's a virtio vendor ID, please reserve a device ID
> > with the virtio TC.
> 
> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this finally
> official.
> 
> Jan

And I guess we will just mark it reserved or something right?
Since at least IVSHMEM 1 isn't a virtio device.
And will you be reusing same ID for IVSHMEM 2 or a new one?


> 
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191111100607-mutt-send-email-mst%40kernel.org.
