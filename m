Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB6VF23TAKGQECXLYRJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F019FC7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 17:04:27 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id t17sf3032132otp.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1ShKaq15Sc8aY4lvxy9lstAJerBkNwrQQLtDds+ZNo0=;
        b=U/FYmmsdQHlKlZKeWgCc7eZ+bCkb+OLYyIGW4dnbCJ6HAQbBKjD1zv8LMjJ0vFcoEs
         fABSoxu6h1uLfP/e9q+ZKnB8VYYEGcKJV5Afs7wOZkoCZp8T2isHV0TK4NsVScN91geD
         +ZH9eYBuv21SDSxilxNk2rT4t7ljCs3dS1K1K3M3eAeJZOoAWLhjpclbiYfyXFu2nY8k
         lE6dBbe9/Av8clfh7xgM164Rv0KWirrHc7nsaFTbJ8xGbFEwlNuQ6AOd4YXGeHYCUPOq
         T1OF8WP4Ao53/0hRtnoxkct/I+wKXfJYvoD5QUGh4tDpPRJa1LNbY9tAMNF3JFczCW9h
         iyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1ShKaq15Sc8aY4lvxy9lstAJerBkNwrQQLtDds+ZNo0=;
        b=eGihQU2OZnf1l1K7Sh69trDX08+6p/hgP+i5ahBxfBNDRY5yA02Q7IBML3lJzlRTRp
         V5JjnJzvORa1nBu/N+hlS+UzL+VAXQqSucNshcZxg4Ri86P13v406SO4cFNfqjHyy4SQ
         3rr8sgXc/l45H7gVPpfZoVH6tX60H1IRM2B6IpRJS4UlZVZq2kjoGnV7YB7cJhc4hR20
         ZBbzTQN+phmx6eXNEcTeY09sLROzGJ2Li+PONUyv6RuR7hOv0rx46kSq+Hadgr5O+Ps4
         YwZp3eXhHqZfmqGpPBLrLbOqR0jAfZwkmWGh0GDXFW1ylC7BlfUKljD3f8qIOsGERZqk
         dtbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrUcs4NxrLizl1LtdaH6WnrH3exxj72PLXP105Xr8+kXsOvtZP
	qYLsthO/RKL86UOd8Qlj+7Q=
X-Google-Smtp-Source: APXvYqy4bIB9001hixLlnLU/I679PPGbZbUQiMqxPnllQiPEFIu/Een4NbAYOt5AIIom2Qqza5JEHg==
X-Received: by 2002:a05:6830:130a:: with SMTP id p10mr7303785otq.273.1557500666544;
        Fri, 10 May 2019 08:04:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3bd4:: with SMTP id i203ls986456oia.14.gmail; Fri, 10
 May 2019 08:04:26 -0700 (PDT)
X-Received: by 2002:aca:d7c6:: with SMTP id o189mr5688021oig.2.1557500665432;
        Fri, 10 May 2019 08:04:25 -0700 (PDT)
Date: Fri, 10 May 2019 08:04:24 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f5ec7031-c1f1-43e7-b9aa-d84ed4ed642c@googlegroups.com>
In-Reply-To: <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
 <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
 <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_993_410318115.1557500664735"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_993_410318115.1557500664735
Content-Type: text/plain; charset="UTF-8"

0000:03:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)

This device is root cause of problems. Are there active link on it?

Is root cell running? What is the status of linux?

What is the below command output 
--sudo jailhouse cell list

Search in forum for "Fault Reason: 0x22". You can see some advice. 

May bee patch needs some professional advice by Mr. Jan.

Could you run a jailhouse config collect for your system and send us the archive and edited sysconfig.c file? 

Thanks.


 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f5ec7031-c1f1-43e7-b9aa-d84ed4ed642c%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_993_410318115.1557500664735--
