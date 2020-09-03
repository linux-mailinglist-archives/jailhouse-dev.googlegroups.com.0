Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLNVYX5AKGQEPR7PGCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 630A025CBD1
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 23:05:50 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id c186sf1388836wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 14:05:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599167150; cv=pass;
        d=google.com; s=arc-20160816;
        b=lPi30zI6Gw7Ibgt7sJmHFkmLwqCUkQiFWmni/U5+nrwPqPRtKUeLYZdxiq20u7nDRf
         DDjv9hWAiWQhrfc7aPIQpXmrYt+OBMxaJQyJ8WA348YhI4xAxIs10ePPdGEIuzs7MC8U
         lFSjlno8uYiZU5tegQvtjFWUCx1hRyuApvNGhH9w0uZxbj7PClHZ2UQqGfTT46FYssSR
         4qaDdxAyOWAoY5zPB8QPr6QR/f7T1t0u/xy6Uc9ju3pz+FVNHKwSe3D6DV8VdnjVfO1/
         57CLrXjer+5XbFgejyPl6F8mAuZcN60tXUIgeaOp41Dp3525r0j1yV1TX/aDJSwBoBSY
         4fkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=mlf8bW/bZpG5aYfpUA7d7MI8Y/pEthQp7KhpmlYyQSM=;
        b=Ml++aUq2bkKnHtvoYWbTZ2d93czIZYYFWHsdsLtpETzdWA08xrtv5RoxmYnK9Uw3Kt
         BVV5ouxy3yMkl7XJzKeseVLh4yafLEpgoDYInFmx6gUysTue+7tg9cfv+oAKgXFaNvyM
         jM5yWtIM7K1KLFZq2XXwzyjvLHSRhZ3dUIXexWcQU+cVJkMFJoF53IN5ctusizACBAMS
         Tdbv5AVrOYMUH5U1c3DzO9utlz0TsLDXI5N9x6Kx1dM2SMoU4or34TxB2NII25pakVyH
         Xd5isfOJuylgQjWY/W5xoPprVyxb//MYcF433ySQK5TrkvmCrZlThYyhf89cbN37G7xy
         fHhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mlf8bW/bZpG5aYfpUA7d7MI8Y/pEthQp7KhpmlYyQSM=;
        b=ORaDY04cUZXqfuensewtJfPasDC9GVgDO5sLF/5nN3rf8ZugwbML7KYrZ5gZHVVf0K
         gTbwnC2nnjGS5o4wOCCkij6a58+QOyq5+PgWCI/jrSOEhYw5Q38h+PplCa1e4RLdYCNo
         ZDwAHnGljvOy+Zbnd0vKF4SsNPPk6Ddxjgu1GypiCEZPY21/wi4Q0BdBICuTlYswO+6d
         0oqFGYqI7ZPaXh3hHhEl7hEJ/5m6tFp1M/ceGzk3RDJQgLQazw3QnDkR9rWu6g93LyQE
         Mib9MgwGd32NEW2xk1voFXhhrzWwg39JKEDEoF39odm6FeRUzdfxL8ZbSO3Es+PbiTFA
         aN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mlf8bW/bZpG5aYfpUA7d7MI8Y/pEthQp7KhpmlYyQSM=;
        b=W2Zs/nYmwiHksj6qCMWcAEcAtGDHOe+6sG/cIHYxSFCNyvb9rqDeY8/iwAjpRoi9+r
         3c8w5l9rbRsyK/VaAxcplMBFSAet8SHvkXr/c5bnJp764t1ylZtq2O92hNqrJd89tvym
         DuRUJRs4kNcxNcVYzyo3xtaU/G9qRVfJb8vLQzL4hidPQjCQTiVQJ/LmJ2o75HiwXB3s
         RpfVd9EtCYQKsxaK4WpGev9Dppnv6MiriZkEpmddM3e9PDihnSn4vNhYgn/zxi3zhr1o
         aGTI1Y0aQ6TMqESvINWVvpZrLHBTdQzfGruPFu6ooYL36fjW9/JPJybkUSt+NNm4j5C2
         x9pw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533unlWC4s6SDDwLJn/C/cYPNbQ9sEvMYi+sWmLyEc3x2l/E9tWR
	JWVkMye/ZTjbjqd/+B4zPqE=
X-Google-Smtp-Source: ABdhPJw6OHABe2jygppBBrTJz+uPkb5yGkV4gWKFuQFH6dKiC+/AO1s+pl3qp0JZ0YsRClDkw5+A9Q==
X-Received: by 2002:adf:db43:: with SMTP id f3mr4691702wrj.219.1599167150090;
        Thu, 03 Sep 2020 14:05:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:230d:: with SMTP id 13ls3491321wmo.0.canary-gmail;
 Thu, 03 Sep 2020 14:05:49 -0700 (PDT)
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr3904059wmf.20.1599167149283;
        Thu, 03 Sep 2020 14:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599167149; cv=none;
        d=google.com; s=arc-20160816;
        b=nUl44YUItb+GdNggpwErfGC0Iq9FYcJhDzqprCqH+p7Eojgl0SYjWWSz/ngVWyDpbx
         CEC4x5aqbpNcohavgQD3dTJ6f2ZRY5AVyEWS47nfz91u2biwn8GVjtWb43KL7y6noOas
         tvmZ5BpgyuFpMOk8teNlZPg4kzHYUt4UAjKzxtsocAlI7gPETxy0RWteIjLu2LBZShHK
         u3YaSGXhtZilLfWmgiI4NmK/71vkjTQLKkYcY5Pae0OBOzuLa9gCxuenXvtf1rsOL5HB
         tJ+hcefDxqfuzerWbZL3FMrdq1PE+CGIDep/e82eAcp/zoOY4x6N5hfBX9XN+Bzo6vNv
         VOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ypTLeHzZ4ynOxpgHtoxXT8v5LnQQQgw40soCjjgPwd0=;
        b=GA802mQmYd6kaG55lSYch+QSJocsNdWcrlNaFETg8mIfObWzi6EKxILkPDS4MiFj6g
         jYHldmPAxM4jyT5i8ziqbedgstkLGLfIOcXbedJNqu6JgH1E1RkeSYTybXUVRTnbooAi
         bZiyFC/yNX3juXmNrK7gfkAMroO2i9JoLUjZuboL10GeoHwlmpKcPPNWr6jS31xAeHDa
         sCu25WGxEgsTqjfYKtScMRGmA/ozjyif77NwLLBg/rj3iZjPqlAB9ydOie6ziEi+wWDt
         5kvNW5AXSQZb2reBcD0UCf0DO7F5og01D/lS8Rm2lcmXdoJE+v5mCjD65biJk4OrFc3b
         PoHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f134si424180wme.4.2020.09.03.14.05.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 14:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 083L5mcr020365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2020 23:05:48 +0200
Received: from [167.87.130.0] ([167.87.130.0])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 083L5kPF017560;
	Thu, 3 Sep 2020 23:05:47 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
Date: Thu, 3 Sep 2020 23:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 03.09.20 22:31, Jan-Marc Stranz wrote:
> Ok, thanks!=C2=A0
>=20
> Is it possible to get a kernel configuration (for Linux Kernel 5.4.x)
> from you?
> It would be very usefull for me in order to find a "right" konfiguration
> needed for jailhouse.
>=20

Sure:
https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linu=
x/files/amd64_defconfig_5.4

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
jailhouse-dev/b501a3d0-70cd-2126-8fa0-fff217caa20c%40siemens.com.
