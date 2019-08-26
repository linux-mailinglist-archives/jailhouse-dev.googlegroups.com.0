Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7FBSDVQKGQEYYTV5LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBF9D498
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 19:03:56 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id k37sf9926255eda.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 10:03:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566839036; cv=pass;
        d=google.com; s=arc-20160816;
        b=iFi4LWqa6mzVc1a+zL62qsoP0HlFVYW06T+STlDRIEPMPJhyN8Norpy3oYh4NemyEq
         FUg4RJKZU4DZ08P3Ye2m5+jjsPQHCREcA7CWIcmqQdCK9uCD6pQ6PDTz2EJxZTy4zCvY
         mvyiDmlRHvk8owdY8DVpXU/GOp/zJON5JAkl1+dBIb4qs604E+cngVmDLPAfVuZYsYHZ
         liLhdHwx4fg+ZAqdpbtKgv9SW2Hjjv7/RFMI9esSHoaHog3dfhnxlL/SiOQDUFUyhGKA
         mUWdZYF0DpX1Y0ig5IwRAoTj0TfubwVEbscEDjLvAjxmiXe8K/I+vEJakHCv3drNrE+o
         yPLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LpKmZ4cCDc0hJZfW96WJUfltfODdd/JQAf3jCaS/1xo=;
        b=aCDWYZcRGaoKQyJKTJ2egz73gV3LtfMwi4Q3Ckhim5lzeeZ00tOD0ys8Ev0R0ozzm/
         kUASmRN4GIU2tUpi4y+tFrN+hN5zwJx0t//x4wKeZ46tmMVn4Kht2L5ELJjYVKk06ev7
         gmbqIWLBdHmXd0ZWfLIm2mQU9TzB8IzR7N/Osua7b1nI8J7q0kqn+85V+gdN7q3uIW1Y
         4WmD7mPZmNHIx9gn5Wa48mIKvnBXbp2NYhkfiVlzFD6jyvzvATcWPZEtCATGKhiEi+Qi
         tLnDlc7L3OS1Jl3P1K09zfGsgHhX2y+QJ3BzOqQctcAiqBkldTtO4D4ci4WdbWSAQWK4
         endw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LpKmZ4cCDc0hJZfW96WJUfltfODdd/JQAf3jCaS/1xo=;
        b=VUHmQdCGY4Ho0Mcd2zl/0UExuVoGcAVwXbIcAIYjAt7eovTb4r6fOYbJzvoIVBJXrT
         ixGSf/OmRxMTjU2crJyrkui0PplUcoiJSjCy64tbkVml9ILgZ4tIN3sXJyQLD144YB+h
         dvfPPDcCn5l5EQf2T0r3NJjeEjIJJVvNt21jrW3esIYIWYKBLtXH3Jglq8JnRkMBdF1a
         bzgYdItya33+pUPJPdFCX9V/JOtDU1qLFuSlnrhtlLoDzjY7eCdB54lh+IqT8GUJX6Mq
         b481CosMBsfqcoObw/OKNvZAV0HFUZ/mO1S3hL/jMv/s5PES+Ab3zMhtfVSm8eXLKF6z
         nI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LpKmZ4cCDc0hJZfW96WJUfltfODdd/JQAf3jCaS/1xo=;
        b=PzYKEomOoGOOLOGUYcopTguhvEQDjDG3uW4ufm6rxhg67XbPoEK8sLsxVqsQE45+Is
         khEEcFzP6IXgAoEew4d45hxwdCpcISmp45F02pOoOUJN1xBtr7rbByfujbO1AJ2ewp9M
         B5AEE0GL7II1cAXnhj4dzeMyWYetkoptYbLWvjIMUWM5t4rZAmGn9wDFkmbTSoLt8Ua5
         AQ72mPAedmoSnhBeal6qhqe1BTNS06HU77pxu7VHjIYCm3pOB+OB+UNhBO2A1n1juovY
         3xUDPo4VCCEmA0LedyfEpjd+fQM2D79S3NsstG3WM1ZdpMy3ex93YPYnmcazTRDkMdkt
         Rnrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUQRz6fnLMqKFb9llQ1PcpJb8vn4EmG6ynUMz3QldCyjKsXus2C
	/patCByXpuzDTXpJ0S+R+PE=
X-Google-Smtp-Source: APXvYqz9T233WGlEvF0OBpVPYZe9rcGSDvUT3ww/Bhht/5aqFeItoNq2hmAPLCsQ1RIVHZwTQ45mTw==
X-Received: by 2002:a17:906:2a8f:: with SMTP id l15mr17861548eje.146.1566839036448;
        Mon, 26 Aug 2019 10:03:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8599:: with SMTP id v25ls5665288ejx.5.gmail; Mon, 26
 Aug 2019 10:03:55 -0700 (PDT)
X-Received: by 2002:a17:906:19d3:: with SMTP id h19mr17976749ejd.58.1566839035783;
        Mon, 26 Aug 2019 10:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566839035; cv=none;
        d=google.com; s=arc-20160816;
        b=vDUkGtYti1KNEtPX6zvOKZ7mNyHGVXHdNmn752jiDjsNlioW+H2Nwc6tdC5wKVVcoY
         OROmmPhn04JzQqDqVO8TfU/G3rLKIQqTcIfPmdIiPuS1hsY8sVDDP2lxWvDOrsHIKA/G
         N28dZKa5zupRjr/RUtvmjvNxECT5whe2FTgs8By2wsurt1wTr74/YcXl/EBF2QrLEBlK
         2ZTF63DqMB9C0UMxlR+BHy3bSTzmuflaTYR46YiS6/dPtrCbvqcsluCwID53NIYKVzX5
         9StLUYMhOn9LorhZySCxXZ5YE2pQsTaEylR1QpEoC6lLZXYSpBtfg/jakR7bQZeSv2bO
         /GQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cfAWw3c3CVr5r5cW//rzi/7sepevoPffcChbA2ePaJc=;
        b=MYxhpBd+NPOH9MnX44UqFl6fJc2K7vkkZ3rxtzR5XZyI9odVkEKU2NXLRRzlJ9ADFP
         7uhu08xLVQD3SZeBXZTPJgXQ7IbhFCVVbAb0YXRhN+/+zK0AKnGtAq0xeti6gAahE/Hj
         EEqnp7nbHNdia3sE1nZerAFOulQDJF+HlwUXVJkjBrzxQw9F9uCHkjNPkO1O0QfToLDz
         R1yUkVrZYiWHzGvKUXsjskRmAfn9Ezzkg8wJqLf8GrZZyAXH3X5x3f1h3+mgqdabZr48
         nzntn0AW/ev5ffNqc6I+h1qOEbzPGpWHoRh6W7BduuleeuH4fEQZkEkvyyLpp/PxJBZU
         uFzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d22si491413edq.5.2019.08.26.10.03.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 10:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x7QH3tfe012653
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2019 19:03:55 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7QH3tbT026866;
	Mon, 26 Aug 2019 19:03:55 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
 <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
Date: Mon, 26 Aug 2019 19:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
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

On 26.08.19 18:39, Jo=C3=A3o Reis wrote:
> Thank you, that worked!
> But when i connect to non-root cell using ssh, i issue commands like "cat=
=20
> /proc/iomem", and it still displays the contents if i was still in root c=
ell. Is=20
> it normal?

Are you using the same device tree for the non-root cell? Then no surprise.

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
jailhouse-dev/1c8ad7db-eb23-034d-dbad-33267d4227f1%40siemens.com.
