Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC5VSWGAMGQEAOPCGTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D749B4466EE
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Nov 2021 17:23:39 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id b18-20020a0565120b9200b00401dbc6433asf2927554lfv.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Nov 2021 09:23:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1636129419; cv=pass;
        d=google.com; s=arc-20160816;
        b=J+7COlMB4kYewOEQUb/5hkYSQVXLhwALjU2kTizfPBfYr7ZqgikJEauTpvmqKkBUho
         bqcYO63bHs96iKXo5fJ9ckM+xCN8l3X/Kp5oyaH0+xSouvNMBfKq02pwspatNbY2JJD2
         FAxlDO4cRcsW905Pi0QemB++oVmzo3UgtlMPQIK6FyPAh6qBM4+EM2pEpOoijJ59rfUw
         HfvmjM5IqsdJM8JaHrRaVy8Ow+jzmXdhGgEf740X6QF4w7ieJTk0V6mxJJThGA2kd9hn
         zhOtspJquW00b9Pr3rJKzJpYeJGgxf/VOXQrSx3gNVzAuF1eyL9AUa8uOWD2EoMzeBRG
         jVvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=8maQ0i8kHLVyjc8J19CC6W/Z8wfOLcpcZ0WjrVS7ZQ8=;
        b=InOx+wWe5fO2LXLPkUNXgdtmC8Sixt/Ulex2WvOZweRKLWl4EIrj3OPr9ieAMuaGU4
         XoGpmZy4z140AcCQ15IZLGymjMEUuLjcCQFe7eCw4o9E9PC8UakH41elAMBNk+A7fR73
         O/6Ffs8RoFyDI4eJtb+JKdpNLOGERBX0WWoIKqAvSNj+E3BMYCgnHc2/bZnm+FNM0Duf
         AEyJMiKcqHZTCUEi+dqoqfcpH2EcCF8L9Hwp7D5Y3ti6uEt1Sty+lMkE5Udv/hv5WbK5
         rPW555Gbunyp9SV2/u1oCCi261rpF+t1qb0uTtCl0QXEcsBHzkTQZa9aPxZ6eQWIErSq
         HAnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8maQ0i8kHLVyjc8J19CC6W/Z8wfOLcpcZ0WjrVS7ZQ8=;
        b=SF0Mu/GsS6bIwiqVye4hg3eBRod8l1J09UYOVRZY81d8iy3dS2mJZxWTcT1ioU73My
         s5Skf0laG5yaVUBubykyAMU23/IGh/lvzU4jzf1F/1y/lc0ENd3MHVZNk2LHkbwkPXCf
         bRKDqYZ0eifWfut4KNbytRojGlCTp+J/F6Z5XGJLhhVt6hRjAGd+Mag384jMjnw0Pntl
         WzZ9wILeIBzqNOmewh3QuLE9SC8lFukdvFIEXVKrjaAzk2FNI4kVDRMUXPya2rKOWGXb
         XntcE8U1Gb6BDiVisxakSTZu9oFSTmgb2QHHMpFuS+TrRbT53WUbX7yukONB6K+Vljrp
         kFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8maQ0i8kHLVyjc8J19CC6W/Z8wfOLcpcZ0WjrVS7ZQ8=;
        b=5qxIO25mtVCzPWnosqWEzMh2TGW1X3P7TCGJsri/0hlxRHTPw3nm2TkhGRD0cyO04d
         bN31Rer/wHaHohObjBeC8wnk7t8vM19/9cqJMFoHQYHnUfbmygrdxaRqb7yc7R+x+Jve
         HrKuS9ywxTA4fEs4AzIZ2/mrjoZy/qa/VJBk8op1Yn3Og2OjxuFa4CeOSuJNRSP6psrt
         DOeMZJIs131RjYO7nRWGQpg6QrFeFLQ89x7KPGi6Nmt39y16vnAlWGXj/vUVDUDHf3ke
         owFimb7up5gvvhhhwY4mazBK83V0FB7KyazCDT5gG4IjkTrpQIWHVIrPY18gG36aKrMz
         xDPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532AqPAPv36MQGDc0WJMxrJOdlUWfGu3P9hfg7jZ2R2PBEX2lyes
	y/CAhyr07uK0qwQzmMV0F74=
X-Google-Smtp-Source: ABdhPJwvYbLON9atRLP9i2HX6qoK3eoSlOhV+vsF+QqaKfLJpJuZUuXTdkuxcWFzIaPDDpbSxhi4Lg==
X-Received: by 2002:a2e:b0fb:: with SMTP id h27mr6182318ljl.20.1636129419464;
        Fri, 05 Nov 2021 09:23:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:10b2:: with SMTP id k18ls987457ljn.3.gmail; Fri, 05
 Nov 2021 09:23:38 -0700 (PDT)
X-Received: by 2002:a2e:a554:: with SMTP id e20mr48757130ljn.116.1636129418220;
        Fri, 05 Nov 2021 09:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636129418; cv=none;
        d=google.com; s=arc-20160816;
        b=OkLwX1AfIb/BlLj2PXJkL2/8/druLtDr4S4edi33H0XNVxsLi9eHMNdJP9EhFQDIwD
         m8gu3Ood9ZrlIvETYlbaWChcNQMA76n6pO4ACgCud3GoMaz0Usw/APGwC+QYClCULqaO
         gEqIeC7OrJaxGJk0OLUHTRJMsqvt744rM+HkFhhEirqcGTfsQOmn1VT1ZJQ4bjSw+2ln
         2W4VRe6Hdj2yWoT3mOGdmzx8avlUtqH+q8AswRF2bA1+Ytq+o96AdY/O2bt2uiXQT8IS
         Xt76G7A52vhfgAaC1dgap/iBtWvLNhZRZOLKpsFd45zejcHHECv1fl8cntrbTEfF+kEu
         dZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=FqDhw5RlnKt47guvxwmtk7rQ5+Bs37XhMUPc7kC7kZg=;
        b=k2Z0y6Lzm46G8ebj+jHRAHEoDzgXdugivjvLA9KkSWuBv2/ZrG1NBBN9vZ6MkAfU3x
         Mp+OxEGoyL+xaTzK6W9ilYflTIJxX8MJXSYYbAu0HdN0Y2GL6W4JQKGUh+wViLTTaOkE
         qQr3GE9frde3qaNDkiQIXcurCpMPYYdJrEIWA4+8xBnI9ME7ZC/MtS3FQok+LF9bLAjO
         Jw2euh5xMuUvjvUMy03mcxLAwIDGCV8zxbipbNIQwvQFikceBFU+VgSnlvJv3nH0bjZA
         1t8t8WKDu0KyyMaGkLCby+7TLC1Srf+ivhWZm/XOzIb8McbobKsZgNyZKHoko9+EdF4g
         0EzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f9si507834ljj.4.2021.11.05.09.23.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1A5GNbHZ016337
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Nov 2021 17:23:37 +0100
Received: from [167.87.1.24] ([167.87.1.24])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1A5GNa9n032662;
	Fri, 5 Nov 2021 17:23:36 +0100
Subject: Re: Problem: system hangs
To: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d60a1523-b304-2c16-efee-0c4f0638ba77@siemens.com>
Date: Fri, 5 Nov 2021 17:23:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
Content-Type: text/plain; charset="UTF-8"
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

On 04.11.21 12:47, Raimundo Sagarzazu wrote:
> Hello all,
>=20
> I=E2=80=99m experiencing a =E2=80=9Csystem hanging=E2=80=9D problem when =
jalhouse is enabled. It
> happens with just rootcell enabled, no need to start inmate cells. I=E2=
=80=99ve
> been working on it for several weeks trying to have at least an error
> log or report but I didn=E2=80=99t success. System just freezes.
>=20

Do you have set up Jailhouse to report to the serial port? Are there any
words from it when the system freezes?

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d60a1523-b304-2c16-efee-0c4f0638ba77%40siemens.com.
