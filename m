Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBQXLVDVAKGQES2MPN2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id C482684263
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 04:21:55 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id b25sf51702021otp.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 06 Aug 2019 19:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bMC/hXx+kAgI8vvKPfOYxpYZqInCOnpRDJMQt4s/VjY=;
        b=i/TzxN2T1nI69iwsDkmUsQcWfHrhlNMd27MPH4+9YFUugrf78HKIKxX02cs79U40D1
         8Sf+The/oBvoTiz8PZWyX0rUJhsU3VJOFK5ZvW2gk0/+Qci+SqlNDmiSWZGbvknNJ6Ul
         sngaoxbnrx+7F3V642cZz3AkN32uRO8GalAjiRhMRxsOpbfpTukl6wh6mxPnK/T9na6S
         6ONs8ypyJqnDc7aqOYblsi82dIOrhfaymePQly/gSHEXfN7r683XZ1Xwev5htVwV7Cu+
         RJ/w89F49j8C1HgTKt7wsGqBAUhe1VQ8TFZcuEgE8sLB/097AxMtQXOwrn4mW+NC7Np9
         No1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bMC/hXx+kAgI8vvKPfOYxpYZqInCOnpRDJMQt4s/VjY=;
        b=KC6OOMANv2Cic2QC8Vf0fo44OcS8jbQ/XlZVwgqe/b66aUvG7rLZawLdLhwcdTXNS/
         JxjBBUQ1ehvQ2GsVuLrHQ1L/6C5Ur2wuK4jLOMlRmI2arDvtB/QP9YzfixBRaQrXougj
         WqnRMKVYgGsEYJjwNrHIemoPqzJm+YFxcM9uDfSg9ZLeEQTCDtJepk04ykZWUcWQceV3
         TeEpC6v2rzRSEA88aqTIN2oZ0/S5OseQsuIWp7pGyHHJlDQVFE2JmaEpomPtAQZwczDW
         Ufp6dfjRvlIG7/2bUlgA4OHX0ScR4uY/f4xuJxLE0G44c34Ed5FaOGlROino0Nfu6Z7c
         OnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bMC/hXx+kAgI8vvKPfOYxpYZqInCOnpRDJMQt4s/VjY=;
        b=Og33sXBxpuBjX9BvMquMy3aoWisHG27R47qCCMxdjYhk/x9bG1Q5BFR7pn43QoO4au
         Of7BdFy7XHmFIhfZ3ElJfEW+t3s33Mw1m0o70cUFrrk+k/IwfQhpC1sBl2xjWBb8DxLc
         pfPIm+/PnP0aJyKyUm++CrqHhTeJ2it8AV8cMpSgB/Ys5VS4UMKYqoJAhoCTAz7Qm3a1
         oeQ1XMlRvEXklz1IIQ/b7oncxVg+rEKwCGAybdbuiKhQuqVbTIl2QmcVDLv1BtONUwss
         9e4vMTsmTFd9O2KECTgbvLlz19ckuOeolY23ULIwkuhj+Ql1KKMTL73lKh5Tovepuu3a
         nYhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVx5sh4dQloDAnnqRyMDVRCyGwQK7HG70D3FGdUXebX9MugCH1R
	OsRon6JuY/baWwXLBR5Nqco=
X-Google-Smtp-Source: APXvYqxcmVt7sx3zcN170E88g6nUeQ1MBXwDfjqVL6wuP6+o8L4ZV7RFU+7M8jh4YCZfckXJi4ICOA==
X-Received: by 2002:a9d:eab:: with SMTP id 40mr6109404otj.316.1565144514634;
        Tue, 06 Aug 2019 19:21:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3a44:: with SMTP id h65ls1082666oia.1.gmail; Tue, 06 Aug
 2019 19:21:54 -0700 (PDT)
X-Received: by 2002:aca:fc92:: with SMTP id a140mr3977201oii.19.1565144513871;
        Tue, 06 Aug 2019 19:21:53 -0700 (PDT)
Date: Tue, 6 Aug 2019 19:21:53 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
In-Reply-To: <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2502_1727533215.1565144513117"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_2502_1727533215.1565144513117
Content-Type: text/plain; charset="UTF-8"

I have just one more question: after  i load Linux as non root, how can i issue commands to it? Do i need another uart? Or can i issue commands to non root Linux sharing uart with root?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2add490d-0d13-44f6-9873-d7fcbf1c4141%40googlegroups.com.

------=_Part_2502_1727533215.1565144513117--
