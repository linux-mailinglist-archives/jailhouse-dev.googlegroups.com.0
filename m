Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJWEULTAKGQEUKHXMPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C23D1004A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 21:29:43 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id k6sf12601325wrp.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 12:29:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556652583; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bo8X+yCIycfnxvkBS46xf+Fv4bFegE6eh34Wj7TAzc0SRdiHY/WZBMIsghTVb4N5bx
         L8/QjUyBvHYXBiHu3E6wQBjXTQzk727yhA5FdZt2EmEqF80Imdfrzizvx9bdsjoY/11T
         iY5HDrIdnqSKX4GLgjYwNrIlJLI1HaysZFiXwygHP8ofO4wHQ0mzScjwpG3rHBUYNvix
         SgIs+Pujntt8E1nC4rvYyA+SKvk2uC8PAgRMVTbv7rYbrwbaOoDyQBPXfvtLJlQY03f2
         QYgw1yds0Q4kQ53BBTXxIoGSN4nQ+XRhqeWAQqkI4hI1wGB6TLP49GpzrdsfsG8a48+W
         kp+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=0y70vMddetyCVHbgquiZyX+q9rPRf5UC2SJwTOuNF9U=;
        b=Zix8J/CXYj1/22CnuJbsZ720OM9BQjkAP4tTUzznKlHsIIAUoRlHXWpnAub1rpveEP
         TuFIp2b8Bi06xk2y/LEFAoCLYldCBmIaxI/sb7GHbmADvL6NlcYfk9jJ33M747eBdtDZ
         1FHrZ7B/joSQhrYm2JeoBeyjrp39Yt1avIEAh10RQOof3jK3GQ+1pZg/fUFIpvPbsTqV
         8yax5w9gqTBWTZ+80dyddRzrBNl6g7IjupXqPBmvaYQt14s2lcV8nOa9mrmUxB7hH89n
         EZirfgox0x7oOV3ONnn1TyOKA2QEYdoV+/Y4YbbkEeB2ZvDhH5WdnM/FCnN/uKHsFqUH
         zIcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0y70vMddetyCVHbgquiZyX+q9rPRf5UC2SJwTOuNF9U=;
        b=LrLQMxaMMkih+hnUDfhwrFl0o7oRdl84RZPGEAlrYvIAhIw+Z1+lQP2KZceLLav45L
         BV2PmU5EDpWj1EY6Y4CRoCQhWeJ94S1k87LDChhfCGrsvjUdloZbAqyw8kzP60OmEp4/
         qyIeMWK0lojEkuKxPkLJHh1SreQ4p2d3Z9xIBrusQLEYYrW0MFlIp08ACA3q/oQH03tM
         LHI6jxhP4phea5V8XtC+hvojC8rzomFsEEHztJbiZnI2+ds1ItY6alF8iUvq33VciqWY
         +6u1rfLrQXH3sta01TyX5lQw2D93yMAnPNnu47wTE6BkN4eD2tefHUbI7ruPbxqxY2ZO
         CV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0y70vMddetyCVHbgquiZyX+q9rPRf5UC2SJwTOuNF9U=;
        b=ImAzybILkzbPg87Yy8T0FzEFTIVwJFedaAlaqdqu3EZk/0J418JqM2rXvK0i9/rCOe
         bQNEzvpoA80MEhqyEeQtWt3vepFVRCA+oHROKsYOQx9BP11ur/5cIjEhw1HcLF0fL7Kh
         QKH3+wlP2LH9hJsBMyHoP5zOTgDmgTIyoppDeZ4Vp2D68BJE7nG/xajJJz5qAh/ufy3u
         3On5TJE8EVdBq8x+hYG/wuH4Q8AWt/DRiKjF/b6HaYf9alBhnSjteAZkWR1YqWwVWQAS
         dy0aXqwha1ziP2eow3oPBy8VI2Vkljorp9CDhfD4HC6vnY2CrexLCsNf0nnVeQFqHCxw
         hKFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVsTTZ1NxoqFuFnMG88Cn7R+cc44LuvkPJyKMkn/JHOhmi+AuEr
	ZuhpM7313KXtt5GVcOBPMFM=
X-Google-Smtp-Source: APXvYqy7Rc8vPK71P3EbnNE8n8r1MIS5iKsK6SWAfJL+mxrgW1KJCDPyUWjYDxZlYlWTAht+vivZOA==
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr4384854wmb.39.1556652582932;
        Tue, 30 Apr 2019 12:29:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:188:: with SMTP id p8ls1706149wrx.1.gmail; Tue, 30
 Apr 2019 12:29:42 -0700 (PDT)
X-Received: by 2002:a05:6000:1242:: with SMTP id j2mr25798875wrx.274.1556652582206;
        Tue, 30 Apr 2019 12:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556652582; cv=none;
        d=google.com; s=arc-20160816;
        b=CU9e5OJwEEwdXzEplEDTQ/c7AfqbTn+Zdb7tD/w/d7ZxOLAA5XVl+Bthl6OXZ7UEs2
         go3auIn+kKZi6ol4bx7w4GvmTOj5qi3cOT4IaCObvWHNPO07pRJZ5Rqj4olhBwxEB6CS
         RzF/8DZ+XrReJgHd3S43MB3Nkvb4ygA2UwMhKReVUSR8TwZ0BfboryuvtlLAQhNtV0yc
         eSOUkfuyj/3l954FqWVrBrmyN5eQVf2YhGbVxh8vxrv1vhaFGaeV/CbWaYxk+ellGEzd
         x105u2Q/I1iqcnrJnV0AYE4838R1/rT+89CM+FZ7ON7+f1nMLuWgGv0WTbFht2lyrE4f
         Q6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=AqS7aZvZbzAyGUzuSSul845wks+rSQEJr1jR297h5s0=;
        b=syMYOMgU+YKRarzkEfLu5XWHSE6OViLJB6xqus9W8Yf8wlPSk4OtbHw/nloOvsS4xI
         LUo9Hlu7KD+3/JCbXMG167h/dY/7INrRm6QhDPVxTB/qXBRwUDkGwujU5rDAACN0TDZG
         7dr1Y+4V5P5TFTToqS49dsN5kVW9cel1P/iSNapg9lFYoeStA69P8PjfjRZN6aCTFmo6
         usXom+KiOR6fqR552zlDXWbW2/gCXsXJ7GcFn/5vKPQwUvHLD2irMzGtORinD2SKQ6fc
         4iYhdEdqXagBLQn7NS3ME0vrvprkIW9pqyqpB195yQ2sYOShVjm/rcewNr9yc8VTpsEF
         e0hw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u2si154720wri.2.2019.04.30.12.29.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 12:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x3UJTfa4022024
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 21:29:41 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3UJTfw7029793;
	Tue, 30 Apr 2019 21:29:41 +0200
Subject: Re: Building on Orange Pi
To: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
Date: Tue, 30 Apr 2019 21:29:40 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 30.04.19 19:55, Arvid Ros=C3=A9n wrote:
> Hi!
>=20
> I have successfully been testing jailhouse using an Orange Pi Zero, and t=
he=20
> pre-built images. Very cool!
>=20
> However, for some more testing, it would be convenient to be able to comp=
ile the=20
> inmate code on the device itself, rather than trying the set up everythin=
g with=20
> Yocto or however the images are built. I tried to compile the latest Jail=
house=20
> source on Debian installed on the board, but that doesn=E2=80=99t work ou=
t of the box at=20
> least. Has anyone here any experience regarding this? What would be the s=
implest=20
> way of getting started to compile some code for running various inmates o=
n an=20
> Orange Pi Zero?
>=20

First, you will need "gcc", "make" and "build-essential" packages. Then loo=
k at=20
the development dependencies of the Jailhouse in its control file at=20
https://github.com/siemens/jailhouse-images/blob/master/recipes-jailhouse/j=
ailhouse/files/debian/control.=20
The kernel-headers can be actually also from debian when you only want to=
=20
rebuild the inmates. Then you should be able to pull everything from debian=
=20
repos, and from github (for Jailhouse itself).

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
