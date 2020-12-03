Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG6VUP7AKGQEQCOQKAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id D174C2CD7BD
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 14:39:39 +0100 (CET)
Received: by mail-ej1-x63e.google.com with SMTP id y23sf771439ejp.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 05:39:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607002779; cv=pass;
        d=google.com; s=arc-20160816;
        b=A6NYCWa3dsxs0UScMySOEujY4BZqbdqXRGdy08izNFTAOG65ZMZks2CIOuctXSbKeL
         96+nih0IyCTsrKVXTP0osHGntVcBNuaWe72ZQ51IKAofBgESKftQ5WP6ZUgNPZIQBFhi
         iHr4P7dA4xH0XiJ7g7fbbnrird7alW/76Mu6n1jfWovMKyrTWr5LIZN3Fwx7mQo0eFWL
         Q/DL7xyqtPZF0qf7bZJzBbaTLjyEFLCOwCfcsPYs1sxTBvTD2ExFfpWO6PUy5IXNNNud
         QLGsp8gTUh61DlyRf7mRV1EbuWmZG0t+5en0onyFU5XrIAmnHh3yzWgd94+GoKTFGILu
         U7Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=YFOslhbIkhR6xXit6YSX/JdhIvWrYjwHSsdhUm3g7WQ=;
        b=RxlDXqd67PkvD6rT9uXMeM8zX9Gti+21KiYNqykwTSTyzmErrXavfAUCjbe5EGER3P
         zk1EJXPDc7IQSVsqoT95GOmY5TrWJOZORIpcLQPn1Y+PeUx/v3jENA8YrZfDKxO4Ebtv
         j5y2tiRTJE8e53gcML/H4sHmAKnH95Pn1q3tSyG/juRRxF1po/K+ZfWzwEDcM52TzC61
         kuZdl1PJpbKgtUexpG2dYrb3VJi3EC+7vpmzkrqqcgeKctatj6eGHqGaHvWf44SxX1j4
         P4zCjaikB+WPy75bBMviEeisaD/j84SH2LOqjoavh+lVide6EyTGArz2B0j3CUkhb4w3
         Q3UA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YFOslhbIkhR6xXit6YSX/JdhIvWrYjwHSsdhUm3g7WQ=;
        b=F8oKZMLf2dyfz8M2cg9OAnSYFVoOcqyPi6rvV1sFekSvwGbs9cEVgMrLJLDc7Sx3HF
         5RGoNDSSzP+BABtwvdHyCdhrYrBPz1b8q6080lZkbXxfuYrOqv/E4bE3gam4zczvUOLm
         DWm7e/mccgJe+No1cP1FEKWM7LhJcTPxmDZcENeTULwqdjloaFWvJ3RII0Z4lXtNC3ys
         pe7ZcZNMnOhwMOJvY1Y9f5hWBuwzA8c1lh6dO3IovsfThajdlZx5JIpjlaOd13SSJbZI
         lkpy6mWGGYuY+iM+PKl7LHcIdKpnOdxynnWOqCRTjp5QCMWIFE6/g1TFDLN+Wqw7S4xE
         WR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YFOslhbIkhR6xXit6YSX/JdhIvWrYjwHSsdhUm3g7WQ=;
        b=HccLctfu7c0Xd+R6cYLafDQqY2yKXsg/fBlfTRWFeeIdjI7J9ylmFJCPJcfGJ/BaWW
         QU1/9qE4gZhBfgGfoOhbvenbwfnaL+jcVXfJYRUqAkDOTwBK04XCavMwgm+D7tyHxr5l
         HbCGb1IQwA5Q/nEm0ASgPkdd1SgSHYT/GtI/JMfAMTiOU20dwkxoNnlYk4U+vv0pIt+I
         5XJhLCOuqGA1vEvCXXBjYyvgr6fC4gG6+BwblndkvS5WhSn1OoCkHWkzQ2dHL425qCcu
         H1s1UGqLGUJcASxuEIN2YOgHnlLG/lWhYDFKAjFB5FbNwbJbV9W6US4r/9feP3P7oVEy
         M0lg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531TPC2uol9nqPBqNlIYfBeZ984vAHAlIqRJVdXFf8RYnhMl5tkj
	EywS8K0uW8L/V/vkv+tZoko=
X-Google-Smtp-Source: ABdhPJy9+Ak4W8Gjne/A2fblWINP7Z9cltKYys/y5+zg06evQiahZz5fowCAcY56tSB5Vx32CKRl1A==
X-Received: by 2002:a17:906:6a45:: with SMTP id n5mr2617148ejs.514.1607002779587;
        Thu, 03 Dec 2020 05:39:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c1d9:: with SMTP id bw25ls2554568ejb.4.gmail; Thu,
 03 Dec 2020 05:39:38 -0800 (PST)
X-Received: by 2002:a17:906:7fca:: with SMTP id r10mr2589496ejs.24.1607002778499;
        Thu, 03 Dec 2020 05:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607002778; cv=none;
        d=google.com; s=arc-20160816;
        b=nD6PhIN+hbGFf7QAUPF0YAtKcuhlpGE+Yr35RBDYperq5aalZS49wGkOamEsdL9pw1
         rgDnHQitFAtwawIGQTZ9/l0Hx+oeNViuDNeeeCol+QVDHZdI5/n17+m8A6jINTIe7MRR
         G40Rl31PZohiHjw5cuZecEZgdK/AIMzvl4MC9MGSBPrMzNGggPtOp5tEURQSRBjdhStE
         efOELBON6zmH/IaLoLPTWqFH6gv7ltx63Rd7iimBD/XCfYalchXY5QuNr0ENHtEAjLI7
         4gJw90ab4axQhCeoXpZjRNrFPxgSbhPqWDrTmQRcXkqZC7j7/4Ny0hU9yLMShQTEYFHl
         /eUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=MeUrFmKxVHXWyrGk1UojXELWRIcxDvqc8LHDUCDnIsI=;
        b=xrDzP7IPpSIRCAKl2CIQoi8IR5lb/eaHXimieWn5w8Hv1NVU8dfCbcU94+mEzG+xzJ
         dPvYf30fKAsaKikEOD2cQ7OGFKLmMKguiFpSkmyq4c6JRun9aemOV38Ttg+LsYE9LErz
         3H1bN8XzTazEK5Pic/kGWSqCObs6hJapm1KslQ3UErnVxA4YFcFOfAB6WEzoCdXHGdkJ
         dppDo6Jb+7RMCrJb52QsjbdbEboRODidTZK/k2lCmLnWfOg1D+eEgGvI7gUBABh33YwU
         x9sy/PWwna6bnm1bvedIu24CBpUpFvnTa/nD5gk82eo3uFVjlQjLs0d7a1GQDglcWI91
         oxOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i6si56609edk.4.2020.12.03.05.39.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 05:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B3DdbO1025088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Dec 2020 14:39:37 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B3DdaVd030416;
	Thu, 3 Dec 2020 14:39:37 +0100
Subject: Re: JAILHOUSE_ENABLE: Input/output error
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
 <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
 <PA4PR03MB71840A37E0D9AB045A451369B6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB71846A56477610902A29AE7DB6F20@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c8ea6145-8504-328d-ccfd-e57b052d9ee4@siemens.com>
Date: Thu, 3 Dec 2020 14:39:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71846A56477610902A29AE7DB6F20@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 03.12.20 14:35, Sainz Markel wrote:
> I've been struggling with this with no luck. Any ideas of why this could happen? I've found no info at all about this two checkitems, apparently with the VT-x virtualization enabled should be enough...

This is a VMware issue, nothing you can fix. Their proprietary
implementation lack feature Jailhouse require. If it were a KVM issue,
we could patch the code (as I did a lot during Jailhouse development in
2013).

IOW: Don't use VMware to demonstrate Jailhouse.

Jan

PS: And please avoid top-posting.

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c8ea6145-8504-328d-ccfd-e57b052d9ee4%40siemens.com.
