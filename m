Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBAMSYHTAKGQELMJF7NQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2914CE2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 16:47:31 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id o13sf7577736otk.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1kr3J2xd/6aR6TWxkLYqwdvfUdYbZ+u3bu8+uCq7rT0=;
        b=BgbJN09/TV260Gsx06+Y9J2MwbiRVXL0Ro4Cw2NCv4Wyi/k+v5lkaG80NzYWIcygB0
         63M7FqDTT/E6VR10gQzswsMo/TTKLD8I3WOAqtwTISNR62eQHJZMytDoEfu0E0vQLp8g
         YaGn9qwo8BKojngpTBJSV8zHNYQy7yGvt8ucXbrtDzc8bRZollH8GPdNlK4JlDzOJ2TK
         CE+2txu1QD3nwFMBGTkVes0LZfH3LB/ktAWFs0QwCHvhL5JeoPVQfzFSLpCXGiaZwPY8
         ybVlp18kqKRE7KFz5rlKerdZS33vwNtifuhxwvYeLcUdbdRkLOsDOHTBv2pGc6oAmhHa
         3kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1kr3J2xd/6aR6TWxkLYqwdvfUdYbZ+u3bu8+uCq7rT0=;
        b=o9YhR2W29Dx/5beIPQbiDuw0MKbtyEZU4x7RehdsfCnXWAMWuTdufW8t5kDe3X/iBK
         sMlKwcKNvGl9651WURiiRbmi7Eu9gVMLy748U2ntCv3keHZV8hpWWsknJ7p4tqnwe0gH
         WLiIQHkeDFYlh816CdqYbQZldUHiF+ABoNyqYzQ3/pG5cCw1ePKtkSCCticvvbQkxhqA
         QBRSANHBEEZh5VxXax8YUjzbJadA3qOX1DFOOioNWJH5GD/23zTncfqg43L3678EFu1g
         Aui8B0SUJ2X3kZLfPxqCfg5VwoLjTeNXsSTq7ogK3ib1YsL7R9r5fFma6ENq9vSEvWXH
         8yBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVGsq1nJii6SNCtHoGfK4dIjI6K2t+2K0gyHHpn9Nb5N6C/c/fK
	aRfP392pggcUS36x17UOMfo=
X-Google-Smtp-Source: APXvYqy9FnNk8W6Q6S641rsWqMdMtpYnq12UNwtmS0OiqF6T4AULwW/NNddGUS70JZ+UbWzLrsXREQ==
X-Received: by 2002:a9d:3b06:: with SMTP id z6mr11921741otb.140.1557154050136;
        Mon, 06 May 2019 07:47:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:11da:: with SMTP id v26ls2157563otq.9.gmail; Mon,
 06 May 2019 07:47:29 -0700 (PDT)
X-Received: by 2002:a9d:1428:: with SMTP id h37mr6073455oth.248.1557154049365;
        Mon, 06 May 2019 07:47:29 -0700 (PDT)
Date: Mon, 6 May 2019 07:47:28 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6696c5ac-a0d9-4574-9eff-dd07eb08280c@googlegroups.com>
In-Reply-To: <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_771_111428160.1557154048817"
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

------=_Part_771_111428160.1557154048817
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

This is my first contributing, I have read the documents.

Thanks your helps again.

HAKKI

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_771_111428160.1557154048817--
