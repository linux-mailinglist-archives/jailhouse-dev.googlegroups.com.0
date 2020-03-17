Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHH2YHZQKGQE4SVV63Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA9187A87
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 08:32:44 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id o13sf17132421edt.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 00:32:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584430364; cv=pass;
        d=google.com; s=arc-20160816;
        b=x3tJuR6UESdXk8qcqMz9YctHZdEJhx1IwLp5tXHeqnApxwlwnl5xNjc3hezb0qZfTd
         AsPDzuMeXgeAg+/hERV/Mk+ipQXtp6dAKDY+Ca2T5xZshtjEvjByRU1q0jQKsto0FbGx
         IPZd9W4DqEJG1XzCtbiovfSxOoOxDcFxVXJLxXrMs7bnJWRBPhD4q+lQpVpUVTSEEGMv
         /js8agfiGvBAU+bkckpd5Z1d/xWQhWzUfEefKRiI6+XI2Uk3/QnHJzZQbVbjLRJE6ZLN
         7KzLnnxe0g1jjuyopQLPcrS+4F3TUlaPhlGrU49XkjUL+awkdhhqJtDV3jwLF6P4RCno
         fVZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kQUO0rPkFuN0Urjexe3+4GZ8XOWPNeFZuTrYxCMsQOI=;
        b=NwCJ3k6ueBXaSRxurgaGTzPhFzRZRuCGFrfGeIL0+Zq4UDhcJzTHozBl2q/AqsvYU+
         aP9FE/YbkpU1trJMhXTLmvS9PmYbfouxvTjEBbhC5C6CwODfkeyPvYe4LOmvXdD7hr7j
         dWKArbalS82bSQ943wZf/349Zq2R3rCW0CdGlG5f3OV0WKeDqq+QBBgqGKB5Owl2GmyI
         rp31vUP3tOQH1+LGGZf0dhQaLSaX7nL+dbWYUA5+OjZailrDL2Wmk5HR9Gpy4ylTqHhN
         tjd0LCSqEt3DMCBZy/ogSSiGBZbRyoD8IUtBqYmZZlbeYG+k3FTBtCCIiwtk/dFV2MkS
         EalA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kQUO0rPkFuN0Urjexe3+4GZ8XOWPNeFZuTrYxCMsQOI=;
        b=nOotvUb28v55wLoDoUZCUCdd3JsZ+cUdCVWc7fwN37qH6GQclcGPaKkH2xVvYhI/rY
         EoS58mMHycl7jvyiOaWmvDS5LJMA4U4d1DpRbJ6QDqz67JReQJiF7Ir6BRdIzF2nyIut
         TWBYF0ZjZwhsGyCgjVUlSkybV+ufdDRvg/WrdbO6+ecnO8d3wT/ancf+qcyq45rR2Gvl
         jPWGhBIxekfOFCghHZcHDSE4dIJkoLlmVlDb6Q3p3wfs1q49QQBgiBKXROBYfkNzBjDv
         tAf4dgF5wmneSHXmDJGxOwR9JlIdYJFEfpX6FSC0tJPZaow9K7zQO8Uh3jfnyAyTEIqU
         TP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kQUO0rPkFuN0Urjexe3+4GZ8XOWPNeFZuTrYxCMsQOI=;
        b=r/mginGtDJFfz0qc5382XxC0lWINg9WYY7DRVr0xehwHn364iPn214u/UNtfH9qKyH
         ZhQJ23pPBmIXKzmnAA2QrgdxNs4/95bLSiq0AhLe1OQJ6v+43zVF8aM2EY87I67CLHJ2
         IvCJ/XIevsQ3bKhCJB6KOE3GIMP/Hwg+YsJasHT74bDlolLMYvJIImpCsGSvjplvHJ87
         e7CV2bJqrNqlokspBmU5V0d+LHeswU3k6+atRZ0Ch4FrQRlft9YZo3atX2jPA7rrhQfK
         DrUdbIJKO9IB9DVBqCiO4WgJn7vR0v3JFT1PTJUJ307U7qjwg2gVl3GaIrN1TUZEfjRb
         rfsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ17AijoEKepsZO8zU1vw+2xAyUco0D+FwIVTx+A2EiMVscz/zYZ
	FDMedyjbHQ9sjIJOCA7engE=
X-Google-Smtp-Source: ADFU+vubebRw4Jxy9S+P3a51LzN417eZddskS7MTd0XlSOPBWaeMfVqKBFE95V1CcLeMX8AG3P8YUQ==
X-Received: by 2002:a05:6402:22f8:: with SMTP id dn24mr3722563edb.59.1584430364696;
        Tue, 17 Mar 2020 00:32:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:83a6:: with SMTP id 35ls4404161edi.8.gmail; Tue, 17 Mar
 2020 00:32:43 -0700 (PDT)
X-Received: by 2002:a50:d903:: with SMTP id t3mr3795210edj.349.1584430363796;
        Tue, 17 Mar 2020 00:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584430363; cv=none;
        d=google.com; s=arc-20160816;
        b=XsGuc33HOor3wyw+2OZW/wqHhsoaH4cvspvloQBlM6N/70jYOW/r4HuoYAGvPXE0bG
         CLud6BRVXv7TntIn8I8Ehbhh6iGQq32XZSJLz/XAZKOdgONetIQOj+LFOMWNodIgbavz
         PGdO96w8EZCPT1zH5aGMhOUK4LronnrmVOTcvAkB7NoaKDqj8NgUkerlqTm8CC5EZo3W
         WJiCyYE0JJdOEib+D3s1Y/AQFGJOETtW6vKpftbRE2qtvaMNY6CkTn6t57JkvbI2XH9J
         QZO1bhpBBZWUdH9mZlxXPBNeZj6ctqFiWAd9IeEQNomOulV1P/JLXpSXXlPk/yEcX/is
         19Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=QRq9xFLTM9bQqwih9D34oRYyGUxS9DWdbfKe1F7pX+E=;
        b=OYeQ2a4GDSUbvOqHHKaKJobwXbmGY/hkEDe1ZRtk0Fh2P0YK+VIrFxxIzQsf73K832
         liOjigwkEVHdacgBsmrZ1FY1oxsogrOrR+KMI1IzOpSiV8qYWcJIG4suhCTE3MLsRIfU
         w/bvL9rlFCMNvECdBmI8xd1ZMtXGsoSlK5KRefr2bHfI2WZBjUPsQli7HoyEf4P1MPNZ
         B4ePnwzGAhrMdybV2Tzrh6w2AyUGvFK3Eg+WwXOgUd5HYqWoEov+R0JoSEVGHr/RN5uJ
         szRwn69HZfMsTfVmGXYoAL6ZGREQ2Hn1LeZf0lYTSO2OvExpc4EtPyIkJw6D1oEpoNh7
         SqOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e19si95707edr.3.2020.03.17.00.32.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 00:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 02H7WgfN014171
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2020 08:32:43 +0100
Received: from [167.87.42.164] ([167.87.42.164])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02H7WfBm012014;
	Tue, 17 Mar 2020 08:32:42 +0100
Subject: Re: Initial build error, help
To: Parth Dode <dodecoder@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2384177c-4f87-473f-aa91-c054325438e5@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <edf9ebc6-7c40-90c2-e24d-a5ae8d4dbe5c@siemens.com>
Date: Tue, 17 Mar 2020 08:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2384177c-4f87-473f-aa91-c054325438e5@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 16.03.20 20:48, Parth Dode wrote:
> I cloned the repo .
> I want to build for Raspi 4 , 1 GB variant.
> When I ran the " build-image.sh"
> I get the following error which I do not understand:
> 
> sed: -e expression #1, char 22: unterminated `s' command
> 

Reproduced, a kas-docker issue: Your path to the jailhouse-images repo 
has spaces, right? Avoid that until we have fixed that.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/edf9ebc6-7c40-90c2-e24d-a5ae8d4dbe5c%40siemens.com.
