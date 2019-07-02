Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY4M5XUAKGQEG5O5IXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B715CEEE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 13:56:19 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id x2sf6661041wru.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 04:56:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562068579; cv=pass;
        d=google.com; s=arc-20160816;
        b=uTxX1PGrm+t/Njge6omQOFM/3X/rFabeGW/2tomcWSIOWvy43do+OqqArCA4VRfK7w
         hbcIXq3e1Kpp2ODAq0tgDIVD1Kenhnht5FPC3QfANekb29YFNYYdjw+kA+C0dPUsLy8l
         q4kboaFqjln3JsSgp54YgfQNJqFHDr0NJO+AUTAH7kgcHwZeBC3cYB0Rs0jKX4zYQxuQ
         ejrzSv97EV8RVFKHe9vPONwgw50YgCofi1ELMqVpP1prjsw4YZiEafu9mwRgiI9k6ua0
         5e0pLbW/zmB6201E35eFR3UwXEvCU+zekH7EAV4IUyKsjUkm5rouimT+RcWgcbCkp4mZ
         tIwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Wm9OLS9C5Ty5BcgvLCGTA1Avii4hG8tHY6w7tZQhIe4=;
        b=Ys8fhg9bgUP0UT+dYeFNLXrQudFr8s5UxP0Xg2kVbFzXYU4OTcTUd2I4jgcCpITfrK
         YIaU79rkvsD5iYIbA0qlUaWkGXNx8wcORyC/JD8gicQZE3JM/yFjATCBliw09knCu/Lk
         y4bqF3cnfoN+KrPhmtZuH38eIUq6WbNc0mfpZRtSG86oZIwh4y8cCZHoqrmno3u1zUUT
         uRixGat8igJlqc1MASm8WYYZr5bPuVXhSGvIkaE49W0YtDK0625H/YrVDQC06I4tB1Rs
         5YYZluyTgkTu1CASyITiTPHU9c6fWplH95egxrAKZTPkoDYJS0CiV8xPPeiER6YqJw/U
         Tkxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wm9OLS9C5Ty5BcgvLCGTA1Avii4hG8tHY6w7tZQhIe4=;
        b=IbuGE2VTaHKNx2whUr14h/nykeBLzfokBM4tJyPpDEGpBeDbk9/wYQbKECMhUgT/8V
         +qZUUoKpgRmq6IXkvhlkBFT5nYGddfCrpUbz++SWO1s50YTP4QT6uHxdvhqKHCSjb/ZW
         FVu905zN3tuEAJHsaCguypc3xjRBdpfY6wFlIQVdjOCnNEYx3aAdgn49OovvC1gqhcDg
         cDZ8UN7QuCjhIYjK6TQnfYPnjz4lo83HS0mBpfawvQRAmumzGqrWJa/0JdQnXfWftWh5
         2O4nnPGbg8rnMQA0hEbU6W//GwXqMTNDO2desPbhlq2g2sdm+bckUYKdurNKpaJO2VNP
         5Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wm9OLS9C5Ty5BcgvLCGTA1Avii4hG8tHY6w7tZQhIe4=;
        b=lhou74F6MRZCMHHdTs0ZYBx0MvBUirNg42xD6ycbyEEC8byoG8wf5fvfgbFxrcOzWw
         tgpipWiPpCuCjGJp6rXJ+Y0kR/QmKSsAM1sxl3e1YssApoR4CLg0mxbkpxCY4KzMLVyM
         SIb8zaEzF/jF1yd+/AdmGoQwhzPydt8FC7G06EZTI68hl6JQtN+6RVJ6h1TrgLLqqZd5
         I0Mdl5y1qfjNoynHtMljzPDWMH7IBYVx/6+RAKCqiD5ppyUkcrGLZpX1uiHKPXi3ItpP
         FGhyeKlQ2XeQ7tGRIgC9Scq0BE5F30AHJZInmGDt0CQHFzLIC+P6IStVOEZq/5Sxd+HS
         9TTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYIf6pTc0Z7fA5waRsBKj6gpJ3G3uzN1SGCAUJT5NB4W88Bi4I
	gScKMQSNp+xrv49QhJ4XNjc=
X-Google-Smtp-Source: APXvYqwBtiCiSCTW8A0FU+qI1h+gFjqK1EZDJZC8kbQxJZp1guUmEPB6Swzql7P2AYxbppe0wHwulQ==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr3458578wme.94.1562068579326;
        Tue, 02 Jul 2019 04:56:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:53c6:: with SMTP id a6ls2067330wrw.2.gmail; Tue, 02 Jul
 2019 04:56:18 -0700 (PDT)
X-Received: by 2002:adf:fe51:: with SMTP id m17mr5157416wrs.25.1562068578756;
        Tue, 02 Jul 2019 04:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562068578; cv=none;
        d=google.com; s=arc-20160816;
        b=u8rMT+EW1PNm4uZTiurLNXv/bej5p0mubYROREv3d0imW3udHJQk3FG1Y5xfMunQ4M
         BUiMouOgKlnQt592mVk/vtLsePuUCGdwTstTThErJIU0x3B7saFpXEzWEj7J60bIB+cO
         LTTEAubfs+q0v3k9Xn9V51jyvgaUDaxD9zKBk0vpx3NUpokz6Z7a7xP9gB1nOye+u5FB
         FUeb93I/eN1qVPAsyraUkR+odRA9BmVt4jqxav/z0zX7W+shF17SVJbHutKVUZCzhMNF
         lqmf19Mgb//t4dOWR+CogeA7XxgaaZnWxu5WyuhnhaKu0DocNhfmPry8JmLNNpFOSfaH
         /O8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GY/rS/+3qa26mYlgi1/n4a2ovZfyuFZWOuh2JGZiEJ0=;
        b=d0IFMscRRjYuf9pDBns92nzS2QQrdheAgvFAopbseCapnVHYl7KnhjITtpFlSg+y/F
         I6Xyv21fD102JMppqumLNRUvKx2sQCFnH6MbWh/tZky2Jtw4NzUr/eMaLD45lOoRaSEV
         5ICd+SJ5yN8PSW4nTC/+N5rA8f58ojEVIZtDBj+LzC4pxqvRHjZrmrugZD5uWQXifN3H
         GCc9bNCvfryefKV2QJU8plP1v9oBSX+uvNWpAUDoyhwSqmZ7rurqkof2uTcgWX9VUCIk
         0ZlRdwVbT7FNY1J3hOh6Jr7E2TDVmY52D6jIEWGny1ksi/C1QxJ3evZTLE8B+f8+7+6T
         HhHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v21si131088wmc.2.2019.07.02.04.56.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 04:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x62BuIn1020754
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 13:56:18 +0200
Received: from [167.87.5.28] ([167.87.5.28])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62BuGwu009221;
	Tue, 2 Jul 2019 13:56:17 +0200
Subject: Re: Locking pages allocated via paging_get_guest_pages()
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <dfdf9509-c3e4-e700-e3f7-56cb1e189048@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d14057fa-470c-5347-cf1c-9816694aab85@siemens.com>
Date: Tue, 2 Jul 2019 13:56:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <dfdf9509-c3e4-e700-e3f7-56cb1e189048@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 02.07.19 13:50, Pratyush Yadav wrote:
> Hi Jan, all
>=20
> The pages mapped via paging_get_guest_pages() are mapped on TEMPORARY_MAP=
PING_BASE, and the mapping is over-written when another call to the functio=
n is made. This produces a race condition when two cells have two drivers c=
alling this function. If one driver is not done using the mapping, and anot=
her over-writes it, bad things could happen. Of course, if it is the same d=
river in both cells, you could use a global locking construct for it, but n=
either is this a very clean fix, nor does it solve the case when two differ=
ent drivers are in play.
>=20
> One alternative is to lock TEMPORARY_MAPPING_BASE until a release functio=
n is called to release that mapping (using, say, paging_release_guest_pages=
()). If the base is locked, the call to paging_get_guest() can block. This =
is problematic when the locking is too long. Another option is to return NU=
LL when the base is locked, and then it is the driver's job to re-try.
>=20
> The second alternative is to do away with TEMPORARY_MAPPING_BASE entirely=
, and use the remap pool instead.
>=20
> I personally like the second alternative better.
>=20
> Either way, all code using paging_get_guest_pages() needs to be updated. =
Luckily, it is only used in a handful of places so it should not be too dif=
ficult to update.
>=20
> Thoughts on this problem? Any better ideas than mine?
>=20

I think there is some misunderstanding how mapping in Jailhouse work:

paging_get_guest_pages() requests temporary, per-cpu access to some guest p=
ages=20
in order to process a guest request synchronously. When returning to the gu=
est,=20
that mapping becomes logically invalid, even if it may stay active until so=
me=20
other call to paging_get_guest_pages() on the same CPU. This pattern both a=
voids=20
locking needs and exposing information to the hypervisor that should not le=
ak to=20
other cores and, thus, potentially other cells.

Mapping things to an address from remap_pool is to expose hardware resource=
s=20
permanently to the hypervisor. That is done during setup, not during runtim=
e.=20
Thus, no locking is needed here as well.

Now, how do your needs not fit into this model, and why?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d14057fa-470c-5347-cf1c-9816694aab85%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
