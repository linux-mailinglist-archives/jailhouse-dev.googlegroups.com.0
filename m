Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA7Z5TUQKGQEP33SNRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF07708A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:46:44 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id o20sf5536226lfb.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:46:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564163204; cv=pass;
        d=google.com; s=arc-20160816;
        b=FafHSWfCnRfZ2+oc/CVMxl6a7NV8CRkj/RW++0uDanrUuUnOqBi/SYEAhVcI/tKzkA
         wktlULTmejsJ1o/aTfFau06kAqh6RxKrtkeYyYnYV8FjlR4+947n9kVEe/T9nIVH/5on
         k343Cdgid/nF0pUb4Op7Us5o3ao91OyjGs3Ir0eR/6ocqHdB87s87a768CP3KXcfW8fO
         i64nuRQUFPD3oYCv+iWFjEwL7b0drYyIAtOMdL2grDSIP2sEUZ+RvQJ/QVMI5j3gkhlt
         3xMLGSXIgnRqROnbjt5XyPQsrm8z5TvXZfP2N0XzT0TUAV75aRs+gMZ3FWaKFbSWRFRI
         IgBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Q9R3c/6cbkUjsPBK+1Q7JLEDGEq1hNKpj2ohBXuN9zA=;
        b=nzgleBs2Z39PDDRWWkjbbLA4FCz0L1/OLJXVz74N5wsOz+2lKcQDB0eC7wxY7+GC7b
         pwnqBDPCvsq161LlXnDdO3DHice6iXUED5RTUlcCSuFrT1crZJ9CSQ6bUmBtrcxmgbSc
         xjYtfHIcoV+uOHLjUBGqigeTB6lkpmaW6jaoSISc2P2I/NllSK4bWgcHKrBds1jnaVoL
         36lhQuyUZFu4avP8IL25xFTns6iRPz8AcwTTNCFS4IqBHtZt5o6Xr4XdX/EUymTcjM6v
         lVEfIhjdAWuu9LxOeDmlFtLaM0JGBQ1S4a6bGSDyA/as3ioHrF/RR9LmgDzos/byiM8e
         RlPg==
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
        bh=Q9R3c/6cbkUjsPBK+1Q7JLEDGEq1hNKpj2ohBXuN9zA=;
        b=LuyZrAIEYsqqkCDdDgaGti7NZKnqjbWs9q0fznkH3v9eaNSV5RH0H/dBDkA7dMpu2h
         ygGIbt4J9BDafSPO2RJnG5RIuRiLuoOZTjclaajoYv+To3jfDnCmRQNa19c25WhJyA/N
         5UQj2ewvRrbaQnmBJuJLdIN7JN07znQOA/qbX9n7WZE7VrmYE0MfKQGEPI23oO+Ozsdn
         nS+9NGamlnWakO8e6YmqP3/ZWEEqRJVoqJnsp9h3jqdBh0SBgPznx6ASxxZ2HSGj09Fg
         ZrfmhsyEhvIms4sDPv28J9stt5xLWTjPH55CWS8bKhK6ZE05luQqyVg/hrMKjyrV+2Nk
         KXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q9R3c/6cbkUjsPBK+1Q7JLEDGEq1hNKpj2ohBXuN9zA=;
        b=paKMmTklSokwLNL2jhHij+Pt+rRXSySdmU/cMefee/MwGhoFTBgycQN0Cbb1UiLhwI
         +7uO3DCGKfbWiT4yuQ0dKUimwP3DAsbT4e0D7YI85GmKLgGDURmGQpyA8j/AB5L9RNci
         oPqhs+d+aK/Qf6NrefAhB37tKm+ENqPX3vDu1ByvKTbL1S1KiX9t1nffeD6ZjIplRtLI
         6EqCKqtfVSDq/8UaKEpcOO9T+XMigmGeKWdg8gkgRjPaX0fiB6nedTM2oLyCbXS3qCUs
         agLjB97dE5h7X6yT7zrmODqXhP8K4hgQCjQYm6A3TWIl3618hr81GGqda3Ba3qu6Lmqx
         pWOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjb7ykP46wjv8M82uPTRLfT7MAzLNZuWobCNSQiEhqfz1lSN6w
	Y2mbikNiY1dMz8ApWm9GB6c=
X-Google-Smtp-Source: APXvYqwtmbqtUt6xfGPXilqAc/hbvTZ9U7TYEXY07TMwyPI8uMMLaHLMLddzD1PhdiKMCNG71ZIO8A==
X-Received: by 2002:a19:4a50:: with SMTP id x77mr1106290lfa.91.1564163203934;
        Fri, 26 Jul 2019 10:46:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:553:: with SMTP id 80ls6230063ljf.4.gmail; Fri, 26 Jul
 2019 10:46:43 -0700 (PDT)
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr50146879lji.133.1564163203133;
        Fri, 26 Jul 2019 10:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163203; cv=none;
        d=google.com; s=arc-20160816;
        b=iQ7sc+YnEGVgCvz9f/oYU30DScMw/MbZZO5YzUYwhiN/XBqP5xjk/QNWBaEfyOVA1j
         OvLtYPB8r6H+pX4vVIWas4KnMrDPKRV37yqmmt+YWj6mCgWtgy1+l36WJK5sECZ6H9jz
         7N54DgJ8m98ITYyHc9Mh0+xWrv+fUtIdqrbRw+h8c6nynaG7aZT7pgcLJ8HTk+nyDC4S
         Md96eI9TTD6JI3VhYc5WPdbhdbUNX9/xuMy0nyjwSQUto5TFcJI8peJ8MoiTQBg6xyTg
         7AoO1gFIuLPWC4pEjUv47E8j6lrVo8/o26zygatXLfxTwIrxLCJ6Ytt3SOHb3qbebp7I
         aE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TrpxWUC4sY7klPjfm4stDD2qEoV8AktFnIkOcMVtzM4=;
        b=JdxQIHLiduOL5h5yJ22reEXv9uWEYk2Mqc7lDUFwvtw6Z1aqO3IsxCn7IwDRYrPxZn
         /1nYXJ+Gzm6ksqRo2R+tQqQXV9TcYIldqsEG5KkfFidN5ggeFcVFk2yUNMAYaO7gz0kb
         89Y/+RGOLYVi6zxJq19HP4cwoH0Bx8bmOLFmPb7iipxZlGzwy/DttvNhuhxqiminkd2b
         U6/ypZHAJoFQbpydngEK+LJy47NM227FUnWs8RDFb/l4eTKZtkPJb5g/eioTNaMiDan8
         A4GCYva2bj+e6s5bdffG3dzbjzLhpjfW6b32kLKfRsmzwD6YIUlIb4wtTMdeiKtinBmD
         gDBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q25si2493121lfp.0.2019.07.26.10.46.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6QHkgXV027399
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 19:46:42 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QHkgPq005591;
	Fri, 26 Jul 2019 19:46:42 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
Date: Fri, 26 Jul 2019 19:46:42 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 26.07.19 19:28, Jo=C3=A3o Reis wrote:
> No, the initramfs size is uncompressed (compressed is ~170MB). What -k sw=
itch
> are you referring to?
>=20

jailhouse cell linux --help
[...]
  --kernel-decomp-factor N, -k N
                        decompression factor of the kernel image, used to
                        reserve space between the kernel and the initramfs

Do you have split kernel and initramfs, or both combined into one?

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
jailhouse-dev/6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf%40siemens.com.
