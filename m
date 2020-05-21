Return-Path: <jailhouse-dev+bncBCQYDA7264GRB3ELTP3AKGQEF5TDBXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B651DD5D5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 May 2020 20:18:22 +0200 (CEST)
Received: by mail-pj1-x103e.google.com with SMTP id m7sf6525380pjh.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 21 May 2020 11:18:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590085100; cv=pass;
        d=google.com; s=arc-20160816;
        b=svlXAZ0WVxa6L9kZiHj5PzHVIOeZTKuIeBQOajbKs+Ne+M4AR7wf7uDlKJm92/ncGo
         e7tu7tttL7LFIFyAAK+8sqZDsB0zP8uTbyX6Y73XhxnaqHzYaDPFB/UMwxDYQGLKGPiY
         z6i5yqKTZ1qyu5qGTxRb0/OmHOwFOJ6FJYqKa1fu4M2wJLxTtnkYWdSIKoANmTFUF2zt
         OCECSlNRvVBwUU+MUmLXf5TnvMfgtppDOcGrIeAzn2Rb1A0/xkHuW1+6tbweZrAi/Reo
         +b50Uu6Nmim8pePdu04J5qtTnKAJU3A6eBLRq2TjNN3gUidtLsUcjKwpNvtgsu/dSAiB
         clVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=G+Q5K5sTBwmhki5CFqBv2X8ku4/oOStmethKNroBseo=;
        b=x2NN7ejUxlbdJThvphDGXCf4Z3MJ2mTA7KJxS1X3OYpar/fkfR/L6gjerOdUrN9h/+
         63dxdYvh25cz7c21z+CnJ6seCfhiT5c3X89ov74bxgsBjf5LKCYYTpIIze+OQ7T7mywY
         sLMNhqQAgjKsXJ++bRzvHnWllkuiDGo0a3i4vefKVCPXtrphaOV654Vd1Xa1qg0IOuyZ
         kEkZl/sbzopiSQsBtnzj+jzzHJ9QgjNwWIdNtMzCwIe3Smm6fx1SItuN+iMxiMF6K31Q
         N23aSdJ2ha0k20Loc3pJoWmqumOos1vRkgGZb3YhPh13/zy/9g/uqKLbl+M58frPqWWS
         71Lw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ff4dQjha;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-transfer-encoding:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G+Q5K5sTBwmhki5CFqBv2X8ku4/oOStmethKNroBseo=;
        b=JLi+vzYt6a2kRQ5WKZne500vWRLM3Jyhzb33R2ZEmfipQXDMWDOM8oerykoCPbVo+h
         shtUfhVDT021wdK54C34PRlu+YTCeLtgkF0aKmT7miTifHTv9BWDxfM7bGoCaKGZQoS0
         36CxPyE5vFQfkJOCSVIIFmu3mSoMDC2La3Q42Ha6OZPn/KgssxaJ36rrAb/MWeIGQySv
         cigyqECoky8L/A0RQr2XZtP7hKbbV6kRWMTTb+9DVc9uDUwl3A/PsqLvAMftTLYlXA11
         9nx9a1AV31edR+VLz4F70ZbTwBdj6lo3EGtHalCDxd1RhbRWHrgsztCPY8HIr8i8UiFo
         3zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-transfer-encoding
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G+Q5K5sTBwmhki5CFqBv2X8ku4/oOStmethKNroBseo=;
        b=ZPsdYR2auUIo3m6sJvBCyp/1fjKtoe16qZsQ41XpfeTOLCwaAkPtvG0ofPbOm+Frqc
         hKCjFu8/u3gzRRuz2s5ANI/XnBbNvFu4CKKFe9V3dh+7ch5w1ItmZ0ZRfKvORhC6wugG
         AIwjBiL62s9iXBWHt3sAzKaqEX4K9a2lyjEsFRoft50eRz2CCxZFW8GjqUv9GN3V8dWM
         gjkbrsDl6M2Zt5OCYfkpzfXED+3bWbiYcelTZvYpmgxMB5A0Ey9jKNkp/MszPp3HsMq6
         IaaTV5lJJXFjRlpRCBaxto/C3UUl3pwqP/J1iWw9ULllOWEd9NorlDRhlzhUY3ZochFk
         C22w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532iRQ0+ayvMiroimWkWuc+pmv5ab5e3zIXo9lFmA4aMLBLGjEgl
	4DznucEST71rTrAAHfbwB8g=
X-Google-Smtp-Source: ABdhPJzjCaH4yXPdbGeJgG8j3Qeqa9zAeFWRNlIo1hhz2zhPxTRGGykQFbS+aWmsaE4XRw2gGPXlrQ==
X-Received: by 2002:a17:90a:ad92:: with SMTP id s18mr13088553pjq.30.1590085100669;
        Thu, 21 May 2020 11:18:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:5649:: with SMTP id m9ls890605pgs.7.gmail; Thu, 21 May
 2020 11:18:19 -0700 (PDT)
X-Received: by 2002:a63:c44b:: with SMTP id m11mr9550191pgg.404.1590085099815;
        Thu, 21 May 2020 11:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590085099; cv=none;
        d=google.com; s=arc-20160816;
        b=k9qnm5OTSGhfGULTBgeNI9D4g2f5zMLZQlPwVSYbzAPSS9Zbpmpds3CnwHKy2nuWRc
         h3GqqvoJYJrznHLfkwbvV+zTa+YrkxFdlOjApCXW0aqlHJfm1N/7JB8kL7/8OuEgKGQD
         KUH3c2f4NDXlA7Px8SZVMMUnogIj8SuR1/HsnexBr3wCYd2vquCaqkQhPQLeF2tORWl4
         DjLKaTr0khFgiM1sX+x6jgQT1JROWJHY4Q0sVC4Ii9L5nw7YZYw/yiHQCt/XkZxsufag
         8mXNd1lPgZJt1s/jkpAIuxMImqTIOJpkaK1TXQ6RkUdSAaxoM6a+iutW0dfh5b3KL1u6
         s6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5+mjnIE8AA4knMqIk6GCp7bw7eCFQWMuEySWleOZqVY=;
        b=OGsFb584M+KuOLvL910tz+q3sWNVvFgM/yh5+uB3Tm5N4/C4TmofYyJBi53T2vLBGJ
         j/hJ7Sz1lGC5Y0SGTSCfNfJfjpavK7BV69OAouMnRABP9k9jD2UViqpIkSaHPMRj3ieo
         u90lRRBhEyVSwfjKNP2nqhh/17z+UUg/LhGmDPVyQ1uB/dnRrnMa6DwBI8Q2lqqNUZdK
         ymBbv8/owXJqxLvSXtIxYHvJsyja1PR4RgEi7cC+Sc2CIF3V7Alw8rcx+I8+fw1TlPfm
         wrSahYf8DIhn33/ChZKSAyhmhibFcvNAWCo4maSL01xtNIQjUg9Djit2oKHVmn2XWMmR
         Rh+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ff4dQjha;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by gmr-mx.google.com with ESMTPS id g11si421646pgj.2.2020.05.21.11.18.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 11:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-vDnZQLhAMTmew-Tp-W3e_Q-1; Thu, 21 May 2020 14:18:17 -0400
X-MC-Unique: vDnZQLhAMTmew-Tp-W3e_Q-1
Received: by mail-wm1-f70.google.com with SMTP id n66so2976811wme.4
        for <jailhouse-dev@googlegroups.com>; Thu, 21 May 2020 11:18:16 -0700 (PDT)
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr10376326wmi.41.1590085095784;
        Thu, 21 May 2020 11:18:15 -0700 (PDT)
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr10376304wmi.41.1590085095538;
        Thu, 21 May 2020 11:18:15 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id s8sm4287820wrg.50.2020.05.21.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 11:18:14 -0700 (PDT)
Date: Thu, 21 May 2020 14:18:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, liang yan <lyan@suse.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	Claudio Fontana <claudio.fontana@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC][PATCH v2 2/3] docs/specs: Add specification of ivshmem
 device revision 2
Message-ID: <20200521141642-mutt-send-email-mst@kernel.org>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
 <5ddc4ca4f32bfab8971840e441b60a72153a2308.1578407802.git.jan.kiszka@siemens.com>
 <877dx5fcvo.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <877dx5fcvo.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=Ff4dQjha;
       spf=pass (google.com: domain of mst@redhat.com designates
 207.211.31.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
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

On Thu, May 21, 2020 at 05:53:31PM +0100, Alex Benn=C3=A9e wrote:
>=20
> Jan Kiszka <jan.kiszka@siemens.com> writes:
>=20
> > From: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > This imports the ivshmem v2 specification draft from Jailhouse where th=
e
> > implementation is about to be merged now. The final home of the spec is
> > to be decided, this shall just simplify the review process at this
> > stage.
> >
> > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > ---
> >  docs/specs/ivshmem-2-device-spec.md | 376 ++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 376 insertions(+)
> >  create mode 100644 docs/specs/ivshmem-2-device-spec.md
> >
> > diff --git a/docs/specs/ivshmem-2-device-spec.md b/docs/specs/ivshmem-2=
-device-spec.md
> > new file mode 100644
> > index 0000000000..d93cb22b04
> > --- /dev/null
> > +++ b/docs/specs/ivshmem-2-device-spec.md
> > @@ -0,0 +1,376 @@
> > +IVSHMEM Device Specification
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +
> > +** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE
> > SPECIFICATION! **
>=20
> Has there been any proposal to the OASIS virtio spec to use this as a
> transport for VirtIO?
>=20
> --=20
> Alex Benn=C3=A9e


I think intergrating this in the virtio spec needs not gate the
implementation, but I'd like to see the current spec copied to
virtio-comments list to possibly get comments from that community.


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200521141642-mutt-send-email-mst%40kernel.org.
