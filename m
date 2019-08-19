Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBMPD5LVAKGQETWUK2BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C3926A7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 16:26:59 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id 88sf2317382otc.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 07:26:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566224818; cv=pass;
        d=google.com; s=arc-20160816;
        b=e5XMorOHOar0LalmgG3yfrScG5M09Z4BGhVgjpCftbbUFnGWMgWjd//G08/EDneIfj
         D2E5XFnssql8c8HjUsfLsX1BB1aCdq3dRNm8w8Es6fJ0IKR3yFpV/dRGNR0cTxmLbTIB
         yA9ihwOuX1XqScRfqCf8l6/CoIlvUwMkt2kybjlH16E1ADRSLHQcHQBiRBUjbAxuwTwU
         lIp67PFSWadXEm6GYQABXhkxVFIoAy8afa99/uT+2aK+b0OT4ZuFWYalQMMHUBgUgbxa
         2JHL9YhePzkw9+7P2ysKs6TKbgBg0wHb7y07nvfwLqZtB6I0eP5OtNafgPCqtFtgVFp5
         qZsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=82e5Yg+JoY2SjSM6scYmdQa+wfv3KUIMKP0Si9RHnF0=;
        b=aHncJ1CMDm3aXxhvsEi7Ggx9QVfXpLu5ScccdW62R/KdUKSr9KKq6P0QIRcceFmPaD
         cAFe8sEi5aU4ewEioCyN4eGXy7oiY7qY5Sk6BSLioeC1FJQwRop01fMJN/hsoLFwDsa0
         lOJgcaeD75fmpg2NE1NHMoVluum6r9L+dzsoowxUOpeEc+8Y+Hsjnw1J5+bjVOvoIoNj
         ZwE4PA7PlCo5/NUATVihlajOwyuuGT1SlOvZnAa6pLl1cDjgMs72gQb08g26apFrCO6n
         Y6JiK2kgJnNy4vuV0e64GIEJDa3Xw6mzujaQpXoCtobmN4PH+Ue/WxWgofMt471iy3UM
         MJoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WP5ArP8s;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=82e5Yg+JoY2SjSM6scYmdQa+wfv3KUIMKP0Si9RHnF0=;
        b=Ok83R4EznSVuplbUeogwpoNpQxEkF46w2zQeCvBFJeVOXu/98pUVDhTY3Ix32M1kaF
         knnp72DXhk1pcPmhyjtpGVf74SWFNnt3qb9OAh58/Zwapns5aT9bXIY+ypuy7ypGJBC5
         L6/D3R0m3DUJJQTZ8TAxHYGTIFOkisFNE/NUFAM6Y0JTDZAXCuWPt/ZjhciI/pZ8Y4V8
         AYnU+LgAY+7O+aOPz5ulJdVFUPGxm4UwT9jicGZ+9HyDCeKICscSDzMmjRxs66asEv9w
         NA9X5q5Dao35R6QQySDph3uC8YTQpGeNd3+O/YhQPTV4KGBD0pr/sQS1qqzTOeOPOqEc
         PTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=82e5Yg+JoY2SjSM6scYmdQa+wfv3KUIMKP0Si9RHnF0=;
        b=h+FlWOedUie1HNRjoV9zShr9DGXs9xILJ0R3MfRPNMTheQrXxnhfsOBuXa1m8DTbVC
         MkGfvO7YsxPWoP7f+XdIAON8XBwBVaB+iGZCWpw7qNBiEK8AU56hH0iqptEhKa1b6MTo
         IHXcWHEEhO28cELdJ/Cw9llG3WRtr5aAw5GkdNsISvC848E0naC6OErGcTwzHxEh7vy6
         hJW1ghLefmVinge1YXwWPD6R3kp8S+XYipn8Fv4o54dNtscaV3kdReohnwjrNSmVIogY
         lm3Vuc3KRL7FtzFzO5VyNzT75tS01zTu2KAnLHbzyzcDvvrz+9gxhuylmFK3XRaNE08c
         /60g==
X-Gm-Message-State: APjAAAUANtDbE77lZiHlC6E+EAswFdb6Urxmu4E/vPGHXjNV8wyVUDZZ
	qv6m+iFycwVt9RTxEVrXB44=
X-Google-Smtp-Source: APXvYqxmSwbWcsLFY/gEy+u81opM1Z65MclXjp/l8IZ2MMsV7HvhrGgrvK5Hh1oiMFt1L5bD6IBV7g==
X-Received: by 2002:a9d:7a94:: with SMTP id l20mr18850325otn.66.1566224818148;
        Mon, 19 Aug 2019 07:26:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:12ee:: with SMTP id g101ls3039029otg.16.gmail; Mon, 19
 Aug 2019 07:26:57 -0700 (PDT)
X-Received: by 2002:a9d:66c5:: with SMTP id t5mr19621735otm.255.1566224817754;
        Mon, 19 Aug 2019 07:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566224817; cv=none;
        d=google.com; s=arc-20160816;
        b=bzS61urht5KBFb57o+ly/kAN2FWfv/EVIso4kiPhIMmSu/Oc+YqN28jEf1pfxxd+Q2
         0kOjf5tVyKF4z4DqTrAICNvkXychZyzBQ8PcLKkFbLiUASbr3fSDy1FiUZUNjJYsiT72
         C7mLZ9+CbbB66LHBKmRjRA8M7G2hwNAE7vL1824XRbqneSuWqce8MQUlJtMMqCpWm9hb
         KrGspPYsvk7pRlHfkXaWI6MTts7Va7vtHMh+ETx2vp8oYFDob1a4RMGeWWANh12Lt3cg
         cAKDt1ByPqlbbPkkxeiWvb6JrncAy4701T+0/90Wk7sz1RNGZt/Bq5tQLt+hm8WWfQae
         dJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=D3O9PCFLHFE9R5NKMPR5fopmhrwRlqRfKH1cQwWTyMk=;
        b=vPGXvKMIVh+TPLVJgA/ZUjJJNBKmcjioZ+rPQmVoC+o6Zw7uMuNs7Ssc9ggjdxXpVH
         w6N1Z5ygtpJQ7TRIJe+mb16cWSxDmLmDXRlx+igo36QEStP8zezULXsuU1oREPZpRqc8
         M5HIinbPNsArdl3UY2B501liS+PcdtYHgZzRSJPmhwUqxreXGx2sDLYyO5y/HlvpR9q7
         CBSbSykSokY4Nq/5/VwA1KOEk0lPw/mt9ufwsh8GklJ04aWhnhh6t2wnqa4WESFw5Fjf
         CNeSqN6HJeM6t3qTkLPpZI503DFMEp3GfNeNKPMEI2LMUStd7gj3ewSfM+msJLCm8uh8
         PzSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WP5ArP8s;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id m4si893656otk.1.2019.08.19.07.26.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JEQv75084538;
	Mon, 19 Aug 2019 09:26:57 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JEQvhd106776
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 09:26:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 09:26:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 09:26:57 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JEQtgw128856;
	Mon, 19 Aug 2019 09:26:56 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 0/4] Initial support for j721-evm board
Date: Mon, 19 Aug 2019 19:56:49 +0530
Message-ID: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=WP5ArP8s;       spf=pass
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

This series adds support for the Texas Instrument's j721e-evm board.
The J721E SoC belongs to the K3 Multicore SoC architecture platform
for automotive applications such as infotainment, cluster, premium
Audio, Gateway, industrial and a range of broad market applications.

Nikhil Devshatwar (4):
  inmates: uart-8250: Add MDR quirk for enabling UART
  configs: arm64: Add support for k3-j721-evm board
  configs: arm64: Add gic and uart demos for j721-evm board
  configs: arm64: Add Linux demo for j721-evm board

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 499 ++++++++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-gic-demo.c     |  72 +++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 242 +++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c    |  72 +++++
 configs/arm64/k3-j721e-evm.c              | 343 ++++++++++++++++++++
 include/jailhouse/console.h               |   7 +-
 inmates/lib/uart-8250.c                   |   4 +
 7 files changed, 1238 insertions(+), 1 deletion(-)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm.c

-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1566224813-20129-1-git-send-email-nikhil.nd%40ti.com.
