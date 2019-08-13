Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB25UZLVAKGQEPL4BBKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493C8B660
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 13:09:32 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id w11sf704626wru.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 04:09:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565694572; cv=pass;
        d=google.com; s=arc-20160816;
        b=OBLozwYkM7OhAv8jv6PtizkBhb3YC+c/MwqzYIjz+4Rzm9EvcMBbvLoLhE4eaU/th6
         AupnZh1NzfggB47fWkwn2SMmm6isa86ywifMDes8srqW+M2GuCHhw1hiEf446pvxU+a7
         nw3XveSTAti+/Lo+7LhfAbXXQlSo0XjCUxVSlQ5Xftgw70Afzkd7Xei9zMXU95sxjTF0
         CMkOg6HbytjMjoaFSbZftSN+hMBPMD4get6QTZudbQ+MoBRYVXfyX3sZ1oEK+u+5haKL
         QPM/ANH0pLWqCYVejJkDjgY2miIFp/cSDE9deJMnypWab7HwYRKfIP9kI/nX9Zad+XvQ
         dqTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ZROS9bmpVwjfM8hY2Mpcotqe2m+1vDOzY6eIYkZf0lg=;
        b=aMS8d8LRpKYPdGf27piC4Na+Dxpf/8Ftjhid8scdi96/YOKQv0bV4crgdKBXGBEROV
         RRwQuW79oRLGwydL6Y3SZ+p3huF+L6jAs9uhZNP3syePHQ61d1kzjd4I3N/Qq3uEjEhx
         6WOwWAbelQZBtQ9QTN81FcPO3TsbC8E9z4dScyZc/lJm205cp9AHHmb8FFRl4KgZRMMb
         UH+nF4qh5Ip+oNxp7Z/H7bf1cGAcZnAg62WYdo0w4OXq9+xWcqX3dUWO5jP0132m4ClB
         FMAV74RsSfCacHvRLkUkayUZ1qW48QYUzWqO3Ps2UXG58v7ta+T5+PHoLODYQcn+d5N3
         K6ow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZROS9bmpVwjfM8hY2Mpcotqe2m+1vDOzY6eIYkZf0lg=;
        b=sWaDc5+C96fomfXoHwk/mHOEnM4WuCrW9v8e4dugdifcSVwrSdo5Y4AHv2JY+BjYd/
         N4w47nHF7mQ9Iso7TlOtlj4XhBn1zoZMQqgTHepzz2NH8SNNBtF8Bjiapk7XoQzzMtPQ
         rEFj99yYzFm//t26O8PTS4zcpGRzMB0j+N3j0CVpYo6nm387JCyhFGlfgHM91aQd1mYY
         ZJoZTD/WQh8NNwEw7N/lBy/b5wPBFPED+42DEWMLHT0QaxY4BjNvZ+knPNoHSFYMRwNk
         HRQdPB9gLUtfuXbUKrvvps/d/v1jBT/NZLHti8fACmywEujs2rANmlv/bHL9AjtPV4/K
         kDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZROS9bmpVwjfM8hY2Mpcotqe2m+1vDOzY6eIYkZf0lg=;
        b=j7iAq+GmV1yJuRQKhEjVQIB9iW32mLWUkOPEt3GMd5iVLlfHvxvNOkkJIBvc9NTeLT
         ie9F4HOHvJ5yPZh036uXAm/cLqn8tu7QtRISkXF4uVR4PKl26uqTT9xhgmC/DT/dmXqz
         K9TW6vCmEVU4HmfgGG/ajBEPflJq1eMWmGV3cZdThdgZtvxGLhdAdKlzSHVgWN45GGEx
         gvTAXd+hy3GKEJbnaQT5QzAPPcyAcmc1KdGUVHLJwj6UlIUNHdJ9KXwioig9dQad7r3W
         wVRvejk6yC/jDrfkuKi+CMyhcuLnefLlxF3vMaS7Qx5b4GqUnlUQHHf91v4vuEc/ofcu
         ri9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMUetYafDUN7lN5SIjP6zu6fPiIonmq0WVLhznbaXde5x93sLd
	1z7z1sSOO+ZzKjKoT1UKIpU=
X-Google-Smtp-Source: APXvYqyW9KgsYNVOjBKAlMbH/8VbD1HGxHBJUEJtmS6O0+nJ9Zf1hVZUrZfs28pVoVLqfkz4zlJhaw==
X-Received: by 2002:adf:f705:: with SMTP id r5mr22217568wrp.342.1565694572251;
        Tue, 13 Aug 2019 04:09:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:bac4:: with SMTP id w4ls31017908wrg.13.gmail; Tue, 13
 Aug 2019 04:09:31 -0700 (PDT)
X-Received: by 2002:a05:6000:148:: with SMTP id r8mr18454856wrx.312.1565694571443;
        Tue, 13 Aug 2019 04:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565694571; cv=none;
        d=google.com; s=arc-20160816;
        b=T9q/8sv5xxDo355PFcA8x7OYVpNC2M7myeAWPUvNnefJM0fuv4XkwNfEqywl9Hms9k
         IEWrxdkKzzSqAnulGJHhQlPVzim5+d9Io5kK7b7qb5IHhvN84ZurzOpLppQhgwv8kec7
         GRL7UXqq+0vrvt7VE9MFC0eppMYk1R3IhwarFh7ayBjwC8YCrTB+3Ikm3ckGcLmsz/bU
         mBZn2v0beCwYq4YXY8zHLQ23ZS7Fak7AVIET5+LF0z50WTIBy/+StP3G13zSMzq+xx7F
         JFeFTq6GXrNwgOFFK9xN4if9cWBlqbcOFWZmGi5u0Gtop+5Tb+RtmE3nEacTWsdMQttC
         D0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=s6aKXfqu5ST8UevnNP4OESOrX6zNPa2NiOv8a/R7ITY=;
        b=NJq3uzTLCJooLsv9VqJgJ19JKFtQZ4e3PTEs+hL6RDw8M/VhHPAvwRbheWsqPXQN2Q
         S4o+WPVoDWV3tM/3S7E/HHKrnfl+ojkqvZh7MyJNSS4NMsBJYZilhXr3V5KPBmc41Qgd
         eCLXnMpTM/sjc1/6CC63zA5J8YhW/z/TYWPz9itw0+RadnPkwLqnatcJwnnYe35grhUK
         oOKdoTzckxL7XKXEjB71Bij99yedEZGgCDtHUymBtQwRFoJrViaZVyj6yrxlmQJjfIwZ
         w3rTXoSgnTedWxLlgYjZ4176IpFEOSitSF4N1pQNQ82Ow/hMDrX4znuuUav/NGnRxELN
         twDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y4si2483670wrp.0.2019.08.13.04.09.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 04:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7DB9Uox020329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Aug 2019 13:09:30 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7DB9S1F012178;
	Tue, 13 Aug 2019 13:09:29 +0200
Subject: Re: Orange Pi Zero Jailhouse Yocto Integration
To: =?UTF-8?Q?Cevat_Bostanc=c4=b1o=c4=9flu?= <bostancioglucevat@gmail.com>,
        jailhouse-dev@googlegroups.com,
        Henning Schild <henning.schild@siemens.com>
Cc: ola@retotech.se, anders@retotech.se, jonas@retotech.se
References: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com>
Date: Tue, 13 Aug 2019 13:09:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote:
> Hello,
> I am trying to learn/play embedded virtualization tools and i saw Isar=20
> Integrated jailhouse-image repo, tested orange pi zero(256mb) image and=
=20
> everything is fine.
> I am trying to integrate latest jailhouse(0.11) into yocto project and i =
saw=20
> https://bitbucket.org/retotech/meta-jailhouse/src/master/=C2=A0, which is=
 for banana=20
> pi with jailhouse_0.8.
>=20
> Anyway, I ported jailhouse-images and meta-jailhouse together(meta-orange=
pi,=20
> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and trying t=
o=20
> compile for orange pi zero(256mb) but I saw many errors while building. c=
an you=20
> guys can guess what is the problem?
>=20
> my status:
> i am trying to build exact image with jailhouse-images so i patched u-boo=
t &=20
> kernel, now i am trying to compile/install jailhouse.
>=20
> You can see build error as follows,
> also attached log outputs too.
>=20

The errors look like they could get better with=20
https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c62=
4405d8c81

> My repo:
> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev
>=20

Thanks for sharing. Henning did some yocto'ization for an internal Jailhous=
e=20
project recently (though that was for legacy vendor BSP) - maybe he can sha=
re=20
some thoughts on your direction.

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
jailhouse-dev/a17c3513-f573-84ad-5d4e-5027121e51b5%40siemens.com.
