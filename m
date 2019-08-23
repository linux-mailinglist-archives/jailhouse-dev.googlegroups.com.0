Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7ED73VAKGQE3TRFQXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2769A759
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Aug 2019 08:04:45 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id q45sf4695279eda.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Aug 2019 23:04:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566540285; cv=pass;
        d=google.com; s=arc-20160816;
        b=vEhm7UoX9yEUQD0DFasW3fAejHjjxqSWQoS1rbhpM6JnAo4QVMLacU0NKlEEmePGgs
         Bz9aMX/PonXLgDWh+wkT/l3dAJ8cE1bFTz9hBbK/DltIvhMrHQ39U46Xw41xytUClm9V
         lQTmt9LnyjSZ9u8nAYfoJbaoRgLS4Z4yyudAt8mleXEC7176+xCpQhYbtoJCNcAVLojW
         XdajgvMIVmB2cg0ovI+zc4RyvcFw8uulrD5JUE6gbvXD5HvvLBfC7bm6yL6PuZxeHekj
         7+BSFdw3vK6SzI7q8XAurWTOd3jN29DfgMXHDKWJvXU6S+T4Oli8U//HN5I0PJVNciYI
         MiGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=I/JgtCM8Tw+XY6C5fkURXrmFf0yVQcSYJoYjmZlTUD0=;
        b=GFWI/7Jjnilpoht1tp6PtGDjWtiZwo+oxbQKGPYyZq0jxjqxq3oPtjUNKfT0Qq9Ae+
         ToCmF2b7O+UQw8f1TJYEcoop7GyBTRthHl6BCoWhxcMaPZiAqOHu9tZBjpL+OwI2eLsj
         vd7eqI2OkNBh4MvmozY7HH+GqWPxf1af3Rlz8rbWWMetngMRu2Gcf+wcRIRC/0f+jX0M
         dq5fN146lHRvxXJ96y24YeD5+FD9doeYwFsVp+/f0Lh9cdstmYrNAox0RMdASWWyvjoS
         lwAs2Vs5cm/Bc9cZ1o7EMoXj1f5vId+dQhWaN3gfQ/9DNVbQ/lMbWhniUd8Oo0vmQXs1
         RX4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I/JgtCM8Tw+XY6C5fkURXrmFf0yVQcSYJoYjmZlTUD0=;
        b=RJCyieH8Yqw+RJgGfc5lOd+EaLnfwvNC/NUiNysY0KvIV8DeY1XPVWZkDso0SqeB61
         KGlUhEgtXLi6x4cW6+WW3nGINlsxCVA3hyyEkdFC47IRODYhnh/+6XfkorIdTYUE/IAE
         +9Mvo7gu7N9exCtF19bMLFbPKntvrFIBFYPlAkG1Z/LUgSAqL2mTMmNyXTrzbD4HZK/u
         OYJJB3uQvS/K1xdABhOIiCwBfyOUU7mvcAS1VccppQeOnwHDGLs8oy/+rHxQ8pmFdC4V
         zpxxWzomaSfSjyCkwF+wgR9fOx2j5maR2cDRZTEkH6AF55BSNKRUohFS6yK15rUyCSDT
         6kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I/JgtCM8Tw+XY6C5fkURXrmFf0yVQcSYJoYjmZlTUD0=;
        b=UcSmGd3oYxwQSm785pG6JLBJIlKrUIhniG8FH919yclOS4W351eGcMAW6YkHFgWjq/
         PKdk2RrP1yAqMfKb+P2OYZWkeDnWopbOLbRwLXbzbYyXccPjxfk/XlyJv5D1ZGzBXNfi
         uBl1PwapN3dk5k+bI77ZN2v4ZFWYo1vr5YPR38wMkxD2BpcjAoKA3uoAYj8G1dPopUKb
         wKEYVe1sV0XWzZJJWA1fWdOoaiwCMUvsTXQLOtYmNQx4UsYwxkqJrSiDM8l3XutDvzex
         mVvXXqAQ8dvvZPOlZmznGgST8PdlwDCxo7/+Hym5wHv+L/hq1Xa6A6hcm1o5kxv2kwMR
         LyIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVMHX6sXGUW58KVfbag6XE3hTMp5MGixXIyaJ+B+g+6tkUqGBaR
	iEyRuBoGOD6kmC43Rae5u5Q=
X-Google-Smtp-Source: APXvYqzlvFiO7uZyezzfsN+yUDRF8V2yw35GWGkKLpFg8OXByvBo51FBn7d+cqwYInG2xSEtFUwBeg==
X-Received: by 2002:a50:c101:: with SMTP id l1mr2679721edf.157.1566540285171;
        Thu, 22 Aug 2019 23:04:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:970e:: with SMTP id k14ls2548527ejx.1.gmail; Thu, 22
 Aug 2019 23:04:44 -0700 (PDT)
X-Received: by 2002:a17:906:1e8c:: with SMTP id e12mr2662442ejj.135.1566540284423;
        Thu, 22 Aug 2019 23:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566540284; cv=none;
        d=google.com; s=arc-20160816;
        b=VARbDOLHg8tIvENmdQt9NOEy4cTonTKRF7w8FUOq+o03jWDAuV5wK8AjknLfmj+Yhb
         MY4HqgKieuD0XzwiKPuGIeShVasMjzbOPGUCPg2xPkkrffmosu0MfP7PKVPmWPV1vuGe
         +v0cSrdrtU8WZQ5Yv7iES4bJNDPiuJd9ZHFS7A6YuyukiSRVb4weSr9CmBNBJ27MtsPE
         E+T2YZG6ZpenbA8cIxih2a9nWaC9FBc7oTn68DmQGycRvF2rYN96Sa9QNT4qgFVYb+Pg
         S/SszGj9RFnuiykbJQUtzMsK1mnRbPex3V4WVufM6WrMSJNkFimMMNC7nAFGRU+8D13J
         IzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=UilRApESKfE+4csfRfyQNy7z2bbuv5BOcZlYZR6oUoc=;
        b=Q9nDcKu+JUNIw6NvY2H2ZvmdamGuXu7hUieERArxP8j8ombMQ0BngIdax34Mf6nKai
         rS8HsfJnXbpwMXNQRe6cwIe937okwS3cU+4OllxDtMlkbfYHlNN2AjmZBDhS/Em65trR
         XH+q3PrdjhVGqH0kXM/GmdEyrgYGAVIZ6lPvFBwZ/wLXeyK4stlUnSoFCvm0OopY5SB8
         1NChN+4IwTHp3qLmbnISF4DPLPsH/xdC2gu4udpclgRyBsKsYzZ8NfKfmduOzxpgDs4F
         wyBrD3F+fgbjFN1HMc/zwkEdRnIt3p/B70SZWB9vfdTe38jtVwISqh6rc9x7D7EQBTXO
         2qgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b39si85373edb.1.2019.08.22.23.04.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 23:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x7N64g57005541
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Aug 2019 08:04:42 +0200
Received: from [139.22.43.154] ([139.22.43.154])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7N64g77007855;
	Fri, 23 Aug 2019 08:04:42 +0200
Subject: Re: Ivshmem-net driver for Linux
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <325fe360-0bf4-4687-b2a2-309e9f9acd46@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d14aeb57-5549-0996-5284-5a5d83cc9104@siemens.com>
Date: Fri, 23 Aug 2019 08:04:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <325fe360-0bf4-4687-b2a2-309e9f9acd46@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 23.08.19 03:12, Jo=C3=A3o Reis wrote:
> Hello everyone,
>=20
> I came across Jailhouse's version of Linux=20
> (https://github.com/siemens/linux/tree/jailhouse-enabling/4.19=20
> <https://github.com/siemens/linux/tree/jailhouse-enabling/4.19>) which ha=
s=20
> ivshmem-net driver on it. I tried to use the 4.14 version of the fork as =
Linux=20
> external source in Petalinux 2018.2 (due to compability), but i couldn't =
boot=20
> the system with that external kernel source. So, i am asking if someone h=
as the=20
> patch for me to apply on Petalinux's default kernel source (4.14.0), or i=
f you=20
> could tell me what files do i need to change in order for ivshmem-net=20
> functionality be available for me.

Did you try to cherry-pick the patches already? Did they have conflicts (wh=
ich=20
would be trivial to resolve) or build issues?

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
jailhouse-dev/d14aeb57-5549-0996-5284-5a5d83cc9104%40siemens.com.
