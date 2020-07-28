Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOW7QD4QKGQEZNCDOTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120A230BF6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 16:01:31 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id t21sf5657892lff.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 07:01:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595944891; cv=pass;
        d=google.com; s=arc-20160816;
        b=UFZzcNeOZ7+xVl2Ia5DVSX5sUeoKkQbDliVuqMRoCvfaDGd/eJL7fvcKgwefKj2471
         aPgbADZfZ8XwPX87HqVCZ+k8G5dQoAQuxPmuZ90ftg9QDPuUdl+MXlBKlgP1Ki+WdA3m
         CCoqG3g7A4P3t4U99HtWn0B5B5RuVz0VGN+9qoj/72iSqK4UoGBSw+/weGwNmW2ZIYPY
         1Br/iY2+tNleE5s3/ACxGcmHC47FKpe68CYWteS32r2I2LzY5ASEfudOJpfgMnnUMyWE
         QIWOOaqUX/1hqDLw5KJHf4BuI66lZ02eWbrcBt32TdSAk6d9QeV6y8YjXKH5QzxAc6sR
         sEfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=w8v2/7JYgagqRkW8GZRXbfimsQinXwoug6AF2UpUcgA=;
        b=GtQQ4SIidbU5wqR3TWzkj8P2lxng8hJ2pm7yZKnhrMx3nGwbO3ixfBRsuQ7bBMqogr
         iv9uDVAPWG2oDK4nbAvP4aUzIrDdSW4IGZb+GG4CV0z/XekfQZkcapkjp+mYjMvp1wA+
         YOTnpZEoYngUsdNRjshDIHQuJWEslXHdMaCvPU6Vzn0xzzcho5iJZJ4+/cU75JnDcOT8
         JWz7BgBZQZwkvmsOWb2OZzidAnhPjNCYrynvlS9f6nJ+a1T6q7HfJyjmi2wp2AWuNrPJ
         eT3X8F5WV1CFra+NbYANsoBNqdqDti14wtwMGx5BnZndtZkLTq9RPVwseYK2gH7/v8iF
         S+tA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w8v2/7JYgagqRkW8GZRXbfimsQinXwoug6AF2UpUcgA=;
        b=rb/ZpnAE/4ti0G+PblmElj8JUMviyruj/TjMRUsi1fUCUY9+QmuuIzKpJZRos1pJcJ
         GH9MOoMFyJ/s/Moj+G0p+oQOuIYQtn57mKi5tRbjq6aZdH2ZnzlK9M7b9V552bx+25VT
         Jej7fzFFsNxzgQ4426admAwiXT0Z3PQ052vKsin+lg0HhIN/kIx/D//O1HEPk9JFMAKl
         XDcngs11iD0AseBZri6HG+DdJlWqG9VQKmyxHpf7HCi6C9xtzrF8sX8Wb75QPv5xQCSc
         fRacr0be7E0hzt73DPY5s3N2J0V4sT/kUO4xY+skif5VLLdW4fxTkylcUE39X+3/6e1C
         omnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w8v2/7JYgagqRkW8GZRXbfimsQinXwoug6AF2UpUcgA=;
        b=nZww29uaiFdu7VS5x+xqQxA4DKH7A5inRAsELsWTx83oxZ8rsg+S3HB1RK1XbYImzu
         DZuUFQLiEU3BgBomEYiaoO5hV9UIyjkJLgfDgnP6PX66YnAv2mecm5C0A95P60fFwiHm
         Xjyxedvs0LGZi7prZB7onQnxKZwoNS/lHRs3URASOO2Au5TuhlmqPymlk+Ma0BxRKF9B
         jegAMNusEFgoKH1HPG3sD6eL9xQVEaasRBCVxQtHGyNo05+4Wpnv9xhlCq8WkVHZvUjt
         H5eDSkT15ZxNUYLnK42qGKMDLDHBtZLJhxuGBK2o3FzoTjagi6yc1jZWwtTUxnfQqzLC
         KWUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Kl0q7SfRGJm8JtGi8l6bUJcr39vcK9irR6NnuNEw79qvFBJK3
	ye/8wsSr257gN06wpVDwoZw=
X-Google-Smtp-Source: ABdhPJwQ/XERZ4v80AUxFSCcefGHx48pOyIy18VQXdzErFi8pQQ/90XvDNhBwsfzG6v7JmD+p1UvGQ==
X-Received: by 2002:a19:4094:: with SMTP id n142mr5176571lfa.166.1595944890478;
        Tue, 28 Jul 2020 07:01:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls245847lfk.3.gmail; Tue, 28 Jul
 2020 07:01:29 -0700 (PDT)
X-Received: by 2002:a19:ad41:: with SMTP id s1mr14704413lfd.191.1595944889503;
        Tue, 28 Jul 2020 07:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595944889; cv=none;
        d=google.com; s=arc-20160816;
        b=qy6GEsNSp1ngxYxGokZMA9/VHMqqxUXfGQ+EHq/+dFMJ5wEd3Lex28l7ZH7tuXBDXw
         0jT08Q/yZLjeLKn8h9tMeDrtWdWMqnoZdZwfGCJl65VyGrqAb21TloPKaEAfxiRG8IYa
         CFlHOJOd7KQ4Izm5bzcXAESjV2e8JTjyAVpl4u+y2dDFG4w1FuM9rtsyMgUKwUOl6FJg
         jO78/CiZ7vB5ohJPps18EyPV2FgD2mcMPK8okyKXvLoNem21mif9mYJzZqEQPbd0gwut
         SiCnsRDf/gF7KpQEoi1QHN9bsDP3+g+j/oBqjGN5SPcPpAl5BPo3KgtLj6nxJDaOZMRh
         MPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xGC3FQjn8km+4T/V/SIjfbqF4uNrjpznIH2bYWEX9/M=;
        b=hHHofPIJbtnK41fMg8AeLJezDvdM8wACjiP8jTGtlyqEVJihEln4pZ9bwppWi6PVIR
         +iP8+FXcssIRPdLeDenbgZlpRCVWaJMVgE+SA8lanfMzc6YpVGK/O3ECzNs6TcdsZBWM
         W6kiXi0jLNHnGvhvKBCJa4Hv/iXo9Y7MUI1re6fDA+8kcNXAKipog+JQtRled7wKD3nk
         Hk++KzpkWZCbTAgapOrp82AB/Y3xrECBbo9s9K8yPSiDiRfM8HQ505X92mBNtguXYITU
         nTCQOOJ28N/rhWwjsE7nFlU6Bv8RVcmMmn2y81olmLXXqc+sS8q9bfL9l3ITaaiEjMRA
         1XBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id b13si593443lfc.1.2020.07.28.07.01.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 07:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06SE1Ssg017346
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 16:01:28 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06SE1Rlf008933;
	Tue, 28 Jul 2020 16:01:28 +0200
Subject: Re: GSoC Report: Week 8
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
 <9c941621-bc4c-ee6d-6a4b-2b9d2d3ac807@siemens.com>
 <60a8d747-b738-45c2-bb9c-7e5bdae0ee64n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5f969958-94ec-35b6-fd43-fb0318991297@siemens.com>
Date: Tue, 28 Jul 2020 16:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60a8d747-b738-45c2-bb9c-7e5bdae0ee64n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 28.07.20 15:15, Jakub Lu=C5=BEn=C3=BD wrote:
>     Sorry, "fixed" that at least now... Unfortunately, I only have a 1G
>     RPi4
>     in reach to do cross-checking.
>=20
>  =C2=A0Thanks
>=20
>     That nice to hear! BTW, who is hosting your GSoC project? AGL?
>=20
> Yes, it's hosted by AGL (actually Linux Foundation). This email was=20
> actually for the agl-dev-community=C2=A0ML, but I've sent it to the wrong=
=20
> one, sorry.

Nevermin. And the background is actually also interesting for this=20
community. Drop a note if the hints I gave reveal new details or you=20
need support in applying them.

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
jailhouse-dev/5f969958-94ec-35b6-fd43-fb0318991297%40siemens.com.
