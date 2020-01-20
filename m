Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBEFLS3YQKGQE3NR4WCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13b.google.com (mail-il1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D8B1429EE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 12:57:06 +0100 (CET)
Received: by mail-il1-x13b.google.com with SMTP id z12sf24830376ilh.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 03:57:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579521424; cv=pass;
        d=google.com; s=arc-20160816;
        b=E6JVIrVo67wCeHht5CO616gE49yvmZB75uCLjjTQQMQQAz/pVLAtyDS0yuCRUu8X8n
         zt6StS7QfeVT4avPaX3UUpd28UcrX+usp2Vwp+SC4uezl0qEZXL/Ar+rpAfI1vgewya8
         hommKp+kUmzwnTDUXJVyxRCJ8eH3/hDSLrZWQEohB5VbQzuks6GrCmKoo1bh67nBQ3Gk
         LX0rUo+tgP3Hd5D8CTIP0q5qaVKTNk+Uo67JWyyRhhykE64juxOlzfnp5naDf6dlUYdE
         BDS9i2l4afAS++jxlpa4srnkU1RvHPDKIMxQ+dCrTeO0gxZal9b/wInVS5ufSWN+9Fvy
         py0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :mime-version:user-agent:date:message-id:subject:from:cc:to
         :dkim-signature;
        bh=s9QbYGPA4t8zENuWFnS8FW+bolST23sywNL6qPvT0pY=;
        b=G4zJfpC2BNt7KtvDDKlEKxq83c48QWeOwzRpWQYb80yHNvYDPguygMJlvZunNwpgei
         ErwCo7f1J0wGFU376hHaZWpNNIdedAeqVH7D6Rz9TADiR+ZREMm2vyRngL0HEtotUdFm
         Ua0w610RA9qo4KCjKQDBnmucuAPHkIzxJ1wl0Jo6p9ZC8xVNm0eMg7JlGJcr31i1+2D/
         OO5O/Q7PDCp+cQnrB2CIioB2dkoV05w46gZWSNEcq1ZbkR0NRbrhwK10FjEv88MUZKgJ
         EHy1khsSi2T2AA0/elnxJUw78GD0sQgR0zS/GKrMjwUk/bdtkHvI39Mmvsr8QoOIe4Cj
         vyvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fel9i6h6;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=s9QbYGPA4t8zENuWFnS8FW+bolST23sywNL6qPvT0pY=;
        b=MzVGpUQErmiex28bQi25P8gK99fixdYX5ZdzG9k7Ckmdje27nnmaVYgPZICeUyx6Tr
         HmnNbPJxRRurshLSYkVzuVCPN3G8vbNzBBcbbmlYAptT5yZtAkQ8mgQNbhzO3tLjTh6p
         OvURbGACtkieZzeA71JYpEhTYKTot0KJi1zHFiOkIVXDhrNLBnoCkMcGpGOaMb73F/JR
         WEnZPL3djHGBHdBY3q4eW14owO4C8hrDuarPmYEESpvy7G4ddAqjSHP7nuD7QJ6I09Ll
         Jh73br6w1L57GccurXuqWupGX0s6baD0o94kIfB27fhqy96C4tRMBRnFAFZCz6PElIdx
         pzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s9QbYGPA4t8zENuWFnS8FW+bolST23sywNL6qPvT0pY=;
        b=hQH5bSXx+607zQcPshBk3elxFe7egcg/Pc4Kyp4tvxyEAxka+CIHaHATqyJ8BtiRsn
         JuNZzzeqlGEWbD5MA4W2svntZr5bDoi+QU/dOCyEQG5+0Pqjcqzxcp2tMlM0kHpuwZDn
         nupntGw1VtB7ONFo9KzktALlWBCLwUtkPPhZYsOnTUrPcCcA62CPl7kisbiImdO1vySd
         7dEzhKFb8VvkhicLXVpIwdtG8aaVEFP16pmadQPqmnwYdS0JL9BrXIfBvuUEI4Ys4vVs
         FIfyJqngDjl9pWzWVuuNaiqaLrJ9fMBiBd2TjF7qSrhprv7HsZbVwCtoTOpO2TraVpzp
         aNnQ==
X-Gm-Message-State: APjAAAXYcrse+k4UFL7lylz5mt5VpPKryzH0MoQBKvxPYAI9lCsfdizZ
	mv1Q6ZnobSvYnDgeODQzOks=
X-Google-Smtp-Source: APXvYqwtb9rrTAABmTUnMPXQVZk3DagYk2v6ISL6kh2wJaxlJQW2RVeN2s1ZNVtCJ70VgqKv4HOJpQ==
X-Received: by 2002:a5e:8a06:: with SMTP id d6mr40130860iok.80.1579521424612;
        Mon, 20 Jan 2020 03:57:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:c411:: with SMTP id y17ls5054887ioa.8.gmail; Mon, 20 Jan
 2020 03:57:04 -0800 (PST)
X-Received: by 2002:a6b:7d07:: with SMTP id c7mr12563718ioq.245.1579521423988;
        Mon, 20 Jan 2020 03:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579521423; cv=none;
        d=google.com; s=arc-20160816;
        b=PnlrI/ziwpWcJEHxXZWtklP1mp0qJ+o2y+1h5oRH2Wix5OjGRH3hLlFCjp20sAV21+
         uiQYfr/bEJ6iOQnF8+7fNvrMtFKsqPjep83Y/C61n1tTM1s7dogQqYIq0/ju0dNK+tmD
         W/vhCakELGOX5EgYZpGXZOVqShnY2ARtgGThLO3ufohokpz8Od/ZOtC4b1v3JOX/pVOX
         Z9zRRvNPCbhrXS5RcGa+qzJjmSjzComifaJ0Yk7kPJO+ZdsQDbsQUIjLx2ZDm33PhDVl
         S0bjp0jS4uNsHIniEgpyDu/GHskjhGiguZYzhH+jhtObZwCPGFXrDCZe7siike2TzTbJ
         C6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:mime-version:user-agent:date:message-id:subject
         :from:cc:to:dkim-signature;
        bh=B2AF1Zu1LqPug1j0nGxCJqx07GnLXNeeOYhTteQmheA=;
        b=FPomRnNxnkr6sWSj6mvnN2Z3iZQUUtPhWL9ZRlledliHgqLfD+6R104ue186qg38hS
         2bYBe3YOm4LuhjPAnTdwSF0N0lzVzvJ5OOubDPM22P/olps7c5/znaQnioU78oy8VEMO
         zN+fojzwr9yeXMu5NGFcIGZ6GdLtfh5CGQ8PxNSa/rSSeQXt9Pzlh0MrUJ6ijVAudCTN
         DKFjNN9VRa8InhGLtG9VuIVVEMgvFwF1wrp6DzpOfu5HvqXErBjSkL1Lw02wUSTXQpj2
         bsJCTBrGXdik+oOnppF5QIoOHYk3XF+GSpPO5jedm5jWxdpHQIh6Rqh93grE56Tioj6c
         wJrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fel9i6h6;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id b16si1085517ion.0.2020.01.20.03.57.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KBv31E051169;
	Mon, 20 Jan 2020 05:57:03 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KBv3jD012918;
	Mon, 20 Jan 2020 05:57:03 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 05:57:03 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 05:57:03 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KBv1GU078075;
	Mon, 20 Jan 2020 05:57:02 -0600
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla,
 Lokesh" <lokeshvutla@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: Next jailhouse version
Message-ID: <b800311d-e075-b2eb-a461-af974d93a0d9@ti.com>
Date: Mon, 20 Jan 2020 17:25:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------897BCE9094AE89AC55B5CFAA"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=fel9i6h6;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------897BCE9094AE89AC55B5CFAA
Content-Type: text/plain; charset="UTF-8"; format=flowed

Hi Jan,

Can you let us know when the next version of Jailhouse is planned to be 
released/tagged?
TI plans to migrate to a stable version as part of the LTS kernel migration.

Regards,
Nikhil D

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b800311d-e075-b2eb-a461-af974d93a0d9%40ti.com.

--------------897BCE9094AE89AC55B5CFAA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <font face=3D"Verdana">Hi Jan,<br>
      <br>
      Can you let us know when the next version of Jailhouse is planned
      to be released/tagged?<br>
      TI plans to migrate to a stable version as part of the LTS kernel
      migration.<br>
      <br>
      Regards,<br>
      Nikhil D<br>
    </font>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b800311d-e075-b2eb-a461-af974d93a0d9%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/b800311d-e075-b2eb-a461-af974d93a0d9%40ti.com</a>.<br />

--------------897BCE9094AE89AC55B5CFAA--
