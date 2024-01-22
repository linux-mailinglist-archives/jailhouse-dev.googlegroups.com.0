Return-Path: <jailhouse-dev+bncBCDLVQP2RIKBBONTXGWQMGQEBNQWSRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x439.google.com (mail-pf1-x439.google.com [IPv6:2607:f8b0:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8278362C5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jan 2024 13:04:12 +0100 (CET)
Received: by mail-pf1-x439.google.com with SMTP id d2e1a72fcca58-6da0d1d6674sf4653271b3a.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jan 2024 04:04:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705925051; cv=pass;
        d=google.com; s=arc-20160816;
        b=HC37DNCVvJC87bAUPmZ7oVmBtraMExiN9E1XwXkGDE8T0+x22ylkCpYXjaHFbnb08w
         oXNRK8frseawgz0kBPWDX8Ri1j29EIVy+/2TZP6mShZfljAphoIbv77VtbVBDLGrQTTO
         ZHe7NluSLS8c828R0d//RgwfdL+/r1OapvliN7xfWSXBG4howdjJIumJFxtWK3v47jNl
         NoUi6fTsHnEvssQOFbEHQLTOYqKSTBNbXpkonqEbE6p6uE8UiMudpVjoplKagz8uhvq0
         G8oC4fMcMFCiswkoDtcJ0xhvhAmwYA6ewur8bg3flqdDI6E6Mq7ttSHpUIA0qFRpVVHb
         KBdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:sid:feedback-id:list-unsubscribe
         :reply-to:subject:message-id:mime-version:from:date:dkim-signature;
        bh=t9x3LywGBH2Yf3Hqlfe89qysd7WJN5c3IDdl0vrawaM=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=wf40VLxSQ3SxZjZ2ci/SMmVFCTYxpveWsdGMghc36L+kXAlvHAwwhWINfoknSH8HRl
         W1cA6Lv4COqj/TL5XOkjcac7xqBQpuxg8Zs73WU+ULpLIxuqON9RaPPcYE1Rl19a//92
         vhIZIOcs1hfxvlKCVzCIJhwISDFZMkGvljJUY4k2mSdCkMYLBgUQf7N9JNCkraUpM3mt
         W+65CjrxTykeOMXJOBtBHTXyC26B+nJXQbThESoWXD7vw1q8tnkxtGMs1vf1fu5Wn00n
         vROfqHb8kek1DLw78MUxplvb2T7e0hOV63fQZ9zB8O/93Tcljw0qRl0xhebQqs7xmB3T
         4OFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=JMc5ubWl;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 149.72.63.254 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705925051; x=1706529851; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:sid:feedback-id:list-unsubscribe:reply-to
         :subject:message-id:mime-version:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9x3LywGBH2Yf3Hqlfe89qysd7WJN5c3IDdl0vrawaM=;
        b=XRsXgSFhlRXH1C7fyG8mQ6P8Ju2U+Nw5W/NEThYlVKVfjp9aTG+KrLyow34e4LWaD8
         dVLHwL0ZdILwYN6RKm5oxUpgsXTBtuMUvXZ2vEn8SYAkZP36uFu+m6zoHpk9ZXFjOkqN
         Xu6QZRW0KZtkqwZm8HJOGLl10R2Zvopn0uaNbJvp1OScXTpXeEIdgPY9y5yq9uXFxIxT
         BFmfBTdBwAFE2htjy7stIdLUWvguWdIZa+WQ08P165SZ0UjOn7759vDyvoQIV6XM5BuE
         X4jTqvEx1BMx2LG/tGePMIp4A5iJ6S1fVWioBnCpUl0erUPeqfv2bTKrpBZnRKoDIyQu
         PPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705925051; x=1706529851;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:sid
         :feedback-id:list-unsubscribe:reply-to:subject:message-id
         :mime-version:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9x3LywGBH2Yf3Hqlfe89qysd7WJN5c3IDdl0vrawaM=;
        b=iju1YsVLaxfqU3iirM/upqWGHacLvQzzevumWsj124Vk2n4jqpWEFDgyBr3SOOlXS6
         +l8sXZ/1IyxgfH+lRSc/GQoW1VTiRTwnDRO/SGiOcV5tZ6ZZhNHzkcwe9vt7nRAGzmQz
         pDqKTiXNGpJwoaoGIAJYZP6u+DvTC2KAjvXQX9xBnVMXAhZmLPOonbvM4PHbFrYGC23B
         AS9N1TRDL+zJa5jiFlDKUvhbWKIwcJK0ZRg6goOTgI/yPSmoeTDW/F7H722eFdobLi/S
         dhOYs+9kI4pHH9TAQVI0Lx3JCS2gCKUONdAtfe6ylTdhucY9xP8V5eyTWL/mOC5Z//S4
         asCw==
X-Gm-Message-State: AOJu0YwyK+TsVOG/AMlL0DL4XozihJgpjwOYWtYV2b43pGV9bb9zC926
	dfinHcjacJV4A4fLdM5d2B8eMBKkw6Y4Tvb9izVATIiLz82VHANd
X-Google-Smtp-Source: AGHT+IGjqKtc8xJf9Zc55GOFhG9MAkicA/1Zl8/qOmshelklHFaiG+k+/4SMurT1n5i/+hq8vjouBw==
X-Received: by 2002:a05:6a00:810:b0:6db:79f6:777b with SMTP id m16-20020a056a00081000b006db79f6777bmr5500512pfk.33.1705925050487;
        Mon, 22 Jan 2024 04:04:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:4b05:b0:6da:838f:2dfd with SMTP id
 kq5-20020a056a004b0500b006da838f2dfdls2958940pfb.0.-pod-prod-03-us; Mon, 22
 Jan 2024 04:04:09 -0800 (PST)
X-Received: by 2002:a05:6a00:810:b0:6db:79f6:777b with SMTP id m16-20020a056a00081000b006db79f6777bmr5500463pfk.33.1705925048778;
        Mon, 22 Jan 2024 04:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705925048; cv=none;
        d=google.com; s=arc-20160816;
        b=sdUWqO+tfQfjDuObzFbVwEjMp05k5rfRnXyZKpM8tTVFIQe25vgnPZyhthlGp8Js1e
         QgojXmArpzMckp1GVBXNAfhOw8wG66qBydNyUrejTsg4Q8xIzN17a68C9sh6IsvTqTxL
         9tpC88cj0S5BRlGKAr8eq+x7DkcQwjuof285W3XovsHMvhRsDiAJjrz+iFugfVEzJUMN
         zavLNmYM/TXaB+tOy5rZRO2u+Axz/H7TyaYXohrSdgy+jOTRApCXNFj0gDjq4LxB+bXx
         11V4lcXotNdlgDs5XDXlik5XpbCyOv5xRYaswn9iliGyCL4FoNf9l9G2bPt0K9dhDqo9
         K6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:sid:feedback-id:list-unsubscribe:reply-to:subject:message-id
         :mime-version:from:date:dkim-signature;
        bh=m8odQ8u6HAvaKFxogk5Ou+tvDyJQOVJc6Vz+sr6dG3Y=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=OMpyF/whf+l078TN3LqqdrnHtow97raUXRcbhxy0LZ3V7f3lKDSGttHYUAVColiDwo
         k+qN77BD1C6oKo74/j4gkulYLZUNimOmLdORGDkfx2YPGgVprdErQwo8sHemI06tG/xq
         myYiIhIqlNhVGa16bY4iYoo6mlDf3LS7qhSwblOhhpAI8ZdrSlgSrd6FdCfbGcyy9CMo
         qIus9FwwGJdYcDj1C9T92/XbN6NRSj4RRmgt35lQDow4Q7eCfikbbAJy5ejZ252fyefz
         y/iBRIFOj9Ipcpg7O+mgjqxLzhSWhtIvHsOB+ueKJKaXgTT5hggiJCKt6XT2aVXm2Hnr
         m8+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=JMc5ubWl;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 149.72.63.254 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
Received: from o79.ptr8036.mail.beehiiv.com (o79.ptr8036.mail.beehiiv.com. [149.72.63.254])
        by gmr-mx.google.com with ESMTPS id w12-20020a056a0014cc00b006dbaf476d70si393045pfu.2.2024.01.22.04.04.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 04:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 149.72.63.254 as permitted sender) client-ip=149.72.63.254;
Received: by filterdrecv-b84d646b4-2t86g with SMTP id filterdrecv-b84d646b4-2t86g-1-65AE59B1-89
        2024-01-22 12:04:01.943069077 +0000 UTC m=+8356920.139174807
Received: from NDAzNDMyOTY (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id youHW_MfRX-4OFwLMgS9Uw
	Mon, 22 Jan 2024 12:04:01.600 +0000 (UTC)
Content-Type: multipart/alternative; boundary=da720858b833882755ddb9c3fd3ffea35df763703c871595a4736d3b8c66
Date: Mon, 22 Jan 2024 12:04:06 +0000 (UTC)
From: "'SEED Conference' via Jailhouse" <jailhouse-dev@googlegroups.com>
Mime-Version: 1.0
Message-ID: <youHW_MfRX-4OFwLMgS9Uw@geopod-ismtpd-32>
Subject: New deadline for Extended Abstracts: February 2, 2024
Reply-To: SEED Conference <seedconf@upv.es>
x-list-id: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-newsletter-id: https://seed-conference-valencia.beehiiv.com/
x-beehiiv-ids: =?us-ascii?Q?{=22account=5Fname=22=3A=22https=3A=2F=2Fseed-conference-valencia=2Ebeehiiv=2Ecom=2F?=
 =?us-ascii?Q?=22=2C=22campaign=5Fid=22=3A=2219ea430b-fba8-485d-b6f?=
 =?us-ascii?Q?1-fbc316e00363=22=2C=22category=22=3A=22newsletter=22?=
 =?us-ascii?Q?=2C=22email=5Fgenerated=5Fat=22=3A1705925040=2C=22user=5F?=
 =?us-ascii?Q?id=22=3A=2271fc7e6d-cd28-47c6-aa1e-5d673d88c2?=
 =?us-ascii?Q?8e=22}?=
x-list-owner: <mailto:seedconf@upv.es>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
x-newsletter-signup: https://seed-conference-valencia.beehiiv.com/subscribe
Feedback-ID: =?us-ascii?Q?19ea430b-fba8-485d-b6f1-fbc316e00363=3Anewsletter=3A71fc7e6d-cd28-?=
 =?us-ascii?Q?47c6-aa1e-5d673d88c28e=3A73c7af638dd0cac?=
sId: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-newsletter: https://seed-conference-valencia.beehiiv.com/p/seed-conference-22012024
x-beehiiv-type: newsletter
X-SG-EID: =?us-ascii?Q?N+FhySnck2RAqxf=2F2q+C0uCc9fID1mnX8DhIspt9DLygZifxTuRvqLjGIeGhBg?=
 =?us-ascii?Q?nvSEhtOibigEoTcVHHcI3ySI=2F5PpSjSRjFmXEV1?=
 =?us-ascii?Q?0RhmX7eQPzU8Zi=2FEcbRULlR5hi2UkWP=2Fc0FglFD?=
 =?us-ascii?Q?6fLFppUYmgicdvi9vkMb434F4l4uZvpKqW10SYh?=
 =?us-ascii?Q?OzVC5Nw=2FIVnvCJukcEn97Hm2jSM9MH=2Fs=2Fnw6joo?=
 =?us-ascii?Q?FOLi9OhnSgX9xliFZIoUk913lIkcGFsxtoM650l?=
 =?us-ascii?Q?o7TU+rBgZrF3G9Yt4HwpYjpMJFYu8Ut3pj0CHzn?= =?us-ascii?Q?yag=3D?=
X-SG-ID: =?us-ascii?Q?N2C25iY2uzGMFz6rgvQsb8raWjw0ZPf1VmjsCkspi=2FLxVM69ceEc1HIRn6NgiB?=
 =?us-ascii?Q?p7MMiDb2u2e3ugxNx07zPxh+NOOhbnvMyq8LEoy?=
 =?us-ascii?Q?cdPocaoYeDS7T5Xmxmm3KNbyVmGLOuacKsLhYqg?=
 =?us-ascii?Q?TwertC6qd77MvMh78+NpmzlKXQmoAGn54g3BmHc?=
 =?us-ascii?Q?a9sRDPT6abUqBIzRPbh7kpW3TWaaSWObjI3w571?=
 =?us-ascii?Q?of6vIoG+uL9NbpHmH=2FuRARm4gYQ7W4nlaSKcCkA?=
 =?us-ascii?Q?MGGrTHM6=2FRbDnGHGezdlQ=3D=3D?=
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
X-Entity-ID: 8Q8jjVs1FPKkJmddSUaV3Q==
X-Original-Sender: seed-conference-valencia@mail.beehiiv.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@mail.beehiiv.com header.s=s1 header.b=JMc5ubWl;       spf=pass
 (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com
 designates 149.72.63.254 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
X-Original-From: SEED Conference <seed-conference-valencia@mail.beehiiv.com>
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--da720858b833882755ddb9c3fd3ffea35df763703c871595a4736d3b8c66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/d3243fed-ffdc-4=
0b5-93e8-7ee15101b085/header-new.jpg?t=3D1705687928)
Follow image link: (https://www.seedconference.eu/)
Caption:=20

# International Conference on Sustainable Energy Education

### July 3 - 5, 2024. Valencia, Spain

Visit seedconference.eu (https://www.seedconference.eu/)

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/b22f2eca-65c9-4=
2e3-adba-535a2d494d69/hero-new3.jpg?t=3D1705687947)
Follow image link: (https://www.seedconference.eu/registration/)
Caption:=20

----------
# In this newsletter:


--------------------
Click on the section below to read more:


--------------------
**Call for Papers**
[Scope](#scope)
[Topics of interest](#topicsofinterest)
[Important dates](#importantdates)



**Call for Workshops**
[Review criteria](#reviewcriteria)
[Proposals guidelines](#proposalguidelines)
[Important dates](#importantdates-2)



--------------------
# SEED 2024: Call for Papers


----------## Scope

The** First International Conference on Sustainable Energy Education (SEED)=
** aims to become a forum for researchers, academics, and practitioners to =
exchange ideas, experiences, opinions, and research results relating to the=
 preparation of students, teaching/learning methodologies, the organization=
 of educational systems, partnerships and funding and governance related to=
 Sustainable Energy Education.

The **SEED** conference will be held on **July 3-5, 2024**, at the **Facult=
y of Business Administration and Management of the Universitat Polit=C3=A8c=
nica de Val=C3=A8ncia (UPV)**, which has been ranked as the best technical =
university in Spain by the Academic Ranking of World Universities since 201=
4.

----------
## Topics of interest


--------------------
The Program Committee encourages the submission of extended abstracts that =
communicate applied and empirical findings of interest to higher education =
and vocational education & training professionals, researchers, and practit=
ioners.
Key topics include, but are not limited to, the following subjects:


--------------------
**Track 1: Teaching and Learning on Sustainable Energy Education.**
_Good practices related to:_

* Renewable energy sources and their development, use, and impact

* Development and use of electric vehicles and the connection to the econom=
y and the environment

* Efficient use of energy technologies for conservation and reduction of wa=
ste

* Nature-Based Solutions (NBS)

* Circular Economy models



**Track 2: Partnerships, Collaboration on Sustainable Energy Education **
_Good practices related to:_

* Traineeships & apprenticeships

* Energy career and workforce development in the energy industry

* Synthesis of energy information

* HUBS in sustainable energy

* Skill needs of the labor market



--------------------
**Track 3: Governance & Funding for Sustainable Energy Education**
_Good practices related to:_

* Financing models

* Financial tools=20

* Financing partnerships in energy

* Business models for energy education

* University spin-offs



**Track 4: Sustainable Education **
_Good practices related to:_

* Competency-based learning and skill assessment

* Education accreditation, quality, and assessment

* Innovative materials and new tools for teaching

* Teaching and learning experiences

* Educational technology (e.g., virtual labs, e-learning)=20



--------------------
Read More (https://www.seedconference.eu/call-for-papers/)


--------------------
## Important dates


--------------------
View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/51962d97-3955-4=
ca5-9ffc-05ac39f2baee/new-dates.jpg?t=3D1705687134)
Caption:=20


--------------------
# SEED 2024: Call for Workshops


----------Researchers, academics, and practitioners are invited to submit p=
roposals for workshops at the=C2=A0**SEED conference**. The purpose of work=
shops is to give room for presenting ideas and discussing preliminary resul=
ts in an interactive atmosphere while focusing on a specific topic. Worksho=
ps may be proposed for=C2=A0**a minimum of 1.5 hours and a maximum of 3 hou=
rs in length**. It should encourage lively debates and stimulate the produc=
tion of new ideas and the discussion of controversial issues.

## Review criteria

The decision on acceptance or rejection of a workshop proposal will be made=
** based on the overall quality**=C2=A0of the proposal and its potential to=
 attract a sufficiently broad community.=C2=A0

----------
## Proposal guidelines


--------------------
**All workshop proposals should be sent to=C2=A0****[seedconf@upv.es](mailt=
o:seedconf@upv.es)** **in English** as a single PDF file (2-6 pages) contai=
ning the following sections:

* Title and acronym.

* Abstract: 150-200 word abstract describing the workshop purpose.

  * Objectives: a clear description of the workshop objectives.=C2=A0

* Description of the topics and scope of the workshop.

* Organizer: a short biographical sketch of the workshop organizer, describ=
ing relevant experience and qualifications.

* Intended audience: description of the anticipated audience, including exp=
erience level and prerequisites, the expected number of participants to the=
 workshop and how the workshop organizer will call for participation.

* Rough agenda: 1-page outline of the workshop content describing the works=
hop dynamics, including tentative speakers, format (panels, call for extend=
ed abstracts, etc).

  * If the workshops consist of the selection & publication of =E2=80=9Cext=
ended abstracts=E2=80=9D (this is only a possibility):

    * Tentative dates

* Review process=C2=A0

* Publication opportunities=C2=A0

* Infrastructure: Description of the infrastructure needed to carry out the=
 workshop.

* Statement from the organizers willing to publish an extended abstract of =
the findings of the workshop (Final version submission deadline July 28, 20=
24)

* Maximum capacity of attendees=C2=A0

* Other information: For instance, information that will let attendees know=
 more about your workshop.


--------------------
Read more (https://www.seedconference.eu/call-for-workshops/)


--------------------
**Resources provided by the SEED organizing committee:**

* A link on the SEED website.

* Management of registration for participants.

* Setup of meeting space and related equipment.



**The workshop organizer must take care of the following:**

* Coordinating schedules and deadlines with the SEED organizing committee.

* Provide a brief description of the workshop for inclusion in the SEED web=
site and the workshop program when it is final.=C2=A0



--------------------
Read more (https://www.seedconference.eu/call-for-workshops/)


--------------------
## Important dates


--------------------
View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/e0cd1559-3afa-4=
178-95fa-cf6bae4f034b/Schermata_2023-12-21_alle_00.06.14.png?t=3D1703113598=
)
Caption:=20


--------------------
**Remember, your workshop proposal should be sent by e-mail=C2=A0**
**by February 2, 2024 to =C2=A0****[seedconf@upv.es](mailto:seedconf@upv.es=
)****.**


----------


=E2=80=94=E2=80=94=E2=80=94

You are reading a plain text version of this post. For the best experience,=
 copy and paste this link in your browser to view the post online:
https://seed-conference-valencia.beehiiv.com/p/seed-conference-22012024

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/youHW_MfRX-4OFwLMgS9Uw%40geopod-ismtpd-32.

--da720858b833882755ddb9c3fd3ffea35df763703c871595a4736d3b8c66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"
Mime-Version: 1.0

<!DOCTYPE html><html lang=3D"en" xmlns=3D"http://www.w3.org/1999/xhtml" xml=
ns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com=
:office:office" style=3D"font-size:16px;"><head><meta charset=3D"utf-8"/><!=
--[if !mso]><!--><meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge"=
/><!--<![endif]--><meta name=3D"viewport" content=3D"width=3Ddevice-width,i=
nitial-scale=3D1"/><meta name=3D"x-apple-disable-message-reformatting"/><me=
ta name=3D"format-detection" content=3D"telephone=3Dno,address=3Dno,email=
=3Dno,date=3Dno,url=3Dno"/><meta name=3D"color-scheme" content=3D"light"/><=
meta name=3D"supported-color-schemes" content=3D"light"/><title>New deadlin=
e for Extended Abstracts: February 2, 2024</title><!--[if mso]><xml><o:Offi=
ceDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:Of=
ficeDocumentSettings></xml><![endif]--><style>
  :root { color-scheme: light; supported-color-schemes: light; }
  body { margin: 0; padding: 0; min-width: 100%!important; -ms-text-size-ad=
just: 100% !important; -webkit-transform: scale(1) !important; -webkit-text=
-size-adjust: 100% !important; -webkit-font-smoothing: antialiased !importa=
nt; }
  .body { word-wrap: normal; word-spacing:normal; }
  table.mso { width: 100%; border-collapse: collapse; padding: 0; table-lay=
out: fixed; }
  img { border: 0; outline: none; }
  table {  mso-table-lspace: 0px; mso-table-rspace: 0px; }
  td, a, span {  mso-line-height-rule: exactly; }
  #root [x-apple-data-detectors=3Dtrue],
  a[x-apple-data-detectors=3Dtrue],
  #MessageViewBody a { color: inherit !important; text-decoration: inherit =
!important; font-size: inherit !important; font-family: inherit !important;=
 font-weight: inherit !important; line-height: inherit !important; }
  span.MsoHyperlink { color: inherit !important; mso-style-priority: 99 !im=
portant; }
  span.MsoHyperlinkFollowed { color: inherit !important; mso-style-priority=
: 99 !important; }
  .a { background-color:#f5f5f5; }
  .b { background-color:#438ac9; }
  .c  { background-color:#ffffff; }
  .d { background-color:#FFFCDD; }
  .d2 { background-color:#FFFFFF; }
  .d3 { background-color:#FFFFFF; }
  h1 { color:#e8195a; }
  h2 { color:#438ac9; }
  h3 { color:#2A2A2A; }
  h4 { color:#2A2A2A; }
  h5 { color:#2A2A2A; }
  h6 { color:#2A2A2A; }
  h1 a { text-decoration:underline;color:#e8195a !important; }
  h2 a { text-decoration:underline;color:#438ac9 !important; }
  h3 a { text-decoration:underline;color:#2A2A2A !important; }
  h4 a { text-decoration:underline;color:#2A2A2A !important; }
  h5 a { text-decoration:underline;color:#2A2A2A !important; }
  h6 a { text-decoration:underline;color:#2A2A2A !important; }
  h1, h1 a, h2, h2 a, h3, h3 a, h4, h4 a, h5, h5 a, h6, h6 a, ul, li, ol, p=
, p a { margin: 0;padding: 0; }
  h1 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
36px;line-height:54px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h2 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
24px;line-height:36px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h3 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
20px;line-height:30px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h4 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:Bold;font-size:18px;line-height:27px;padding-bottom:4px;padding-top:16=
px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h5 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:16px;line-height:24px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h6 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:14px;line-height:21px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  p { font-family:'Helvetica',Arial,sans-serif;color:#2D2D2D;font-size:16px=
;line-height:24px;padding-bottom:12px;padding-top:12px;mso-margin-top-alt:1=
2px;mso-margin-bottom-alt:12px; }
  p a, .e a, ul a, li a  { word-break:break-word;color:#e8195a !important;t=
ext-decoration:underline;text-decoration-color:#e8195a;font-style:italic; }
  p .bold { font-weight:bold;color:#2D2D2D; }
  p span[style*=3D"font-size"] { line-height: 1.6; }
  .f p { font-size:12px;line-height:15px;color:#2D2D2D;padding:0; }
  .f p a { text-decoration:underline;color:#2D2D2D !important; }
  .g p { font-family:'Helvetica',Arial,sans-serif;font-size:14px;line-heigh=
t:20px;font-weight:normal;margin:0; }
  .g p a  { text-decoration: underline; }
  .i p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-siz=
e:15px;color:#2D2D2D; }
  .i p a { text-decoration:underline;color:#2D2D2D !important; }
  .i2 p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-si=
ze:15px;color:#2D2D2D; }
  .i2 p a { text-decoration:underline;color:#2D2D2D !important; }
  .i3 p { font-family:'Helvetica',Arial,sans-serif;line-height:43px;font-si=
ze:24px;color:#2D2D2D; }
  .i3 p a { text-decoration:underline;color:#2D2D2D !important; }
  .h p a { text-decoration:underline;color:#595959 !important; }
  .h2 p a { text-decoration:underline;color:#595959 !important; }
  .h3 p a { text-decoration:underline;color:#595959 !important; }
  .j { border-top:3px solid #DFD150; }
  .k p { padding-left:15px;padding-bottom:0px;padding-top:6px;mso-margin-to=
p-alt:6px;mso-margin-bottom-alt:0px;mso-margin-left-alt:15px; }
  .o { background-color:#FFFFFF;border:1px solid #F1F1F1;border-radius:5px;=
 }
  .o p { font-family:'Helvetica',Arial,sans-serif;padding:0px;margin:0px; }
  .l p,
  .l p a { font-size:14px;line-height:20px;font-weight: bold;color:#2D2D2D;=
padding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .m p,
  .m p a { font-size:13px;line-height:18px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .n p,
  .n p a { font-size:12px;line-height:17px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .p { background-color:#FFFFFF;max-width:520px;border:1px solid #E1E8ED;bo=
rder:1px solid rgba(80, 80, 80, 0.3);border-radius:5px; }
  .q { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !impo=
rtant;border:1px solid #e1e8ed;border:1px solid rgba(80, 80, 80, 0.3);borde=
r-radius:5px;background-color:#FFFFFF; }
  .q p { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !im=
portant;color:#222222; }
  .r { border:1px solid #E1E8ED !important;border-radius:5px; }
  .s p { font-size: 14px; line-height: 17px; font-weight: 400; color: #6978=
82; text-decoration: none; }
  .t p { font-family:'Helvetica',Arial,sans-serif;font-size:12px;line-heigh=
t:18px;font-weight:400;color:#000000;font-style:italic;padding:4px 0px 0px;=
}
  .v { border-radius:10px;border:solid 0px #438ac9;background-color:#438ac9=
;font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF; }
  .v a { text-decoration:none;display:block;color:#FFFFFF; }
  .w p { font-size:12px;line-height:15px;font-weight:400;color:#FFFFFF; }
  .w p a { text-decoration: underline !important;color:#FFFFFF !important; =
}
  ul { font-family:'Helvetica',Arial,sans-serif;margin:0px 0px 0px 25px !im=
portant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:di=
sc;font-size:16px; }
  ul li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
disc; }
  ol { font-family:'Helvetica',Arial,sans-serif;margin: 0px 0px 0px 25px !i=
mportant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:d=
ecimal;font-size:16px; }
  ol li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
decimal; }
  .e h3,
  .e p,
  .e span { padding-bottom:0px;padding-top:0px;mso-margin-top-alt:0px;mso-m=
argin-bottom-alt:0px; }
  .e span,
  .e li { font-family:'Helvetica',Arial,sans-serif;font-size:16px;color:#2D=
2D2D;line-height:24px; }
  .rec { font-family:  ui-sans-serif, system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-ser=
if, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color E=
moji" !important; }
  .rec__button:hover { background-color: #f9fafb !important; }
  .copyright a {color: inherit !important; text-decoration: none !important=
; font-size: inherit !important; font-family: inherit !important; font-weig=
ht: inherit !important; line-height: inherit !important;}
  .txt_social p { padding: 0; }
  @media only screen and (max-width:667px) {
    .aa { width: 100% !important; }
    .bb img { width: 100% !important; height: auto !important; max-width: n=
one !important; }
    .cc { padding: 0px 8px !important; }
    .ee { padding-top:10px !important;padding-bottom:10px !important; }
    .ff ul, .ff ol { margin: 0px 0px 0px 10px !important;padding: 0px !impo=
rtant; }
    .ff li { margin:10px 0px 0px 10px !important; }
    .r {height:140px !important;}
    .s p { font-size:13px !important;line-height:15px !important; }
    .mob-hide {display:none !important;}
    .mob-stack {display:block !important;width:100% !important;}
    .mob-block {display:block !important;}
    .embed-img {padding:0px 0px 12px 0px !important;}
    .socialShare {padding-top:15px !important;}
    .rec { padding-left:15px!important;padding-right:15px!important; }
    .bodyWrapper { padding:10px 4px 10px 4px !important; }
  }
  @media screen and (max-width: 480px) {
    u + .a .gg { width: 100% !important; width: 100vw !important; }
    .tok-heart { padding-top:75% !important; }
    .tok-play { padding-top: 250px !important; }
  }
  @media screen and (max-width: 320px) {
    .tok-heart { padding-top:65% !important; }
  }
  .u { border: 1px solid #CACACA !important; border-radius: 2px !important;=
 background-color: #ffffff !important; padding: 0px 13px 0px 13px !importan=
t; font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,"Se=
goe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif !important;fon=
t-size: 12px !important; color: #767676 !important; }
  .u a { text-decoration: none; display: block !important; color: #767676 !=
important; margin: 0px !important; }
  .u span, .u img { color: #767676 !important;margin:0px !important; max-he=
ight:32px !important;background-color:#ffffff !important; }
</style><!--[if mso]><style type=3D"text/css">
    sup { font-size: 100% !important;vertical-align: .5em !important;mso-te=
xt-raise: -1.5% !important;line-height: 0 !important; }
    ul { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ul li { margin-left: 0px !important; mso-special-format: decimal; }
    ol { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ol li { margin-left: 0px !important; mso-special-format: decimal; }
    li.listItem { margin-left:15px !important; margin-top:0px !important; }
    .paddingDesktop { padding: 10px 0 !important; }
    .edm_outlooklist { margin-left: -20px !important; }
    .embedImage { display:none !important; }
  </style><![endif]--></head><head><meta charset=3D"utf-8"/><!--[if !mso]><=
!--><meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge"/><!--<![endi=
f]--><meta name=3D"viewport" content=3D"width=3Ddevice-width,initial-scale=
=3D1"/><meta name=3D"x-apple-disable-message-reformatting"/><meta name=3D"f=
ormat-detection" content=3D"telephone=3Dno,address=3Dno,email=3Dno,date=3Dn=
o,url=3Dno"/><meta name=3D"color-scheme" content=3D"light"/><meta name=3D"s=
upported-color-schemes" content=3D"light"/><title>New deadline for Extended=
 Abstracts: February 2, 2024</title><!--[if mso]><xml><o:OfficeDocumentSett=
ings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSe=
ttings></xml><![endif]--><style>
  :root { color-scheme: light; supported-color-schemes: light; }
  body { margin: 0; padding: 0; min-width: 100%!important; -ms-text-size-ad=
just: 100% !important; -webkit-transform: scale(1) !important; -webkit-text=
-size-adjust: 100% !important; -webkit-font-smoothing: antialiased !importa=
nt; }
  .body { word-wrap: normal; word-spacing:normal; }
  table.mso { width: 100%; border-collapse: collapse; padding: 0; table-lay=
out: fixed; }
  img { border: 0; outline: none; }
  table {  mso-table-lspace: 0px; mso-table-rspace: 0px; }
  td, a, span {  mso-line-height-rule: exactly; }
  #root [x-apple-data-detectors=3Dtrue],
  a[x-apple-data-detectors=3Dtrue],
  #MessageViewBody a { color: inherit !important; text-decoration: inherit =
!important; font-size: inherit !important; font-family: inherit !important;=
 font-weight: inherit !important; line-height: inherit !important; }
  span.MsoHyperlink { color: inherit !important; mso-style-priority: 99 !im=
portant; }
  span.MsoHyperlinkFollowed { color: inherit !important; mso-style-priority=
: 99 !important; }
  .a { background-color:#f5f5f5; }
  .b { background-color:#438ac9; }
  .c  { background-color:#ffffff; }
  .d { background-color:#FFFCDD; }
  .d2 { background-color:#FFFFFF; }
  .d3 { background-color:#FFFFFF; }
  h1 { color:#e8195a; }
  h2 { color:#438ac9; }
  h3 { color:#2A2A2A; }
  h4 { color:#2A2A2A; }
  h5 { color:#2A2A2A; }
  h6 { color:#2A2A2A; }
  h1 a { text-decoration:underline;color:#e8195a !important; }
  h2 a { text-decoration:underline;color:#438ac9 !important; }
  h3 a { text-decoration:underline;color:#2A2A2A !important; }
  h4 a { text-decoration:underline;color:#2A2A2A !important; }
  h5 a { text-decoration:underline;color:#2A2A2A !important; }
  h6 a { text-decoration:underline;color:#2A2A2A !important; }
  h1, h1 a, h2, h2 a, h3, h3 a, h4, h4 a, h5, h5 a, h6, h6 a, ul, li, ol, p=
, p a { margin: 0;padding: 0; }
  h1 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
36px;line-height:54px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h2 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
24px;line-height:36px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h3 { font-family:'Arial',Helvetica,sans-serif;font-weight:Bold;font-size:=
20px;line-height:30px;padding-bottom:4px;padding-top:16px;mso-margin-top-al=
t:16px;mso-margin-bottom-alt:4px }
  h4 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:Bold;font-size:18px;line-height:27px;padding-bottom:4px;padding-top:16=
px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h5 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:16px;line-height:24px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  h6 { font-family:'Trebuchet MS','Lucida Grande',Tahoma,sans-serif;font-we=
ight:normal;font-size:14px;line-height:21px;padding-bottom:4px;padding-top:=
16px;mso-margin-top-alt:16px;mso-margin-bottom-alt:4px }
  p { font-family:'Helvetica',Arial,sans-serif;color:#2D2D2D;font-size:16px=
;line-height:24px;padding-bottom:12px;padding-top:12px;mso-margin-top-alt:1=
2px;mso-margin-bottom-alt:12px; }
  p a, .e a, ul a, li a  { word-break:break-word;color:#e8195a !important;t=
ext-decoration:underline;text-decoration-color:#e8195a;font-style:italic; }
  p .bold { font-weight:bold;color:#2D2D2D; }
  p span[style*=3D"font-size"] { line-height: 1.6; }
  .f p { font-size:12px;line-height:15px;color:#2D2D2D;padding:0; }
  .f p a { text-decoration:underline;color:#2D2D2D !important; }
  .g p { font-family:'Helvetica',Arial,sans-serif;font-size:14px;line-heigh=
t:20px;font-weight:normal;margin:0; }
  .g p a  { text-decoration: underline; }
  .i p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-siz=
e:15px;color:#2D2D2D; }
  .i p a { text-decoration:underline;color:#2D2D2D !important; }
  .i2 p { font-family:'Helvetica',Arial,sans-serif;line-height:23px;font-si=
ze:15px;color:#2D2D2D; }
  .i2 p a { text-decoration:underline;color:#2D2D2D !important; }
  .i3 p { font-family:'Helvetica',Arial,sans-serif;line-height:43px;font-si=
ze:24px;color:#2D2D2D; }
  .i3 p a { text-decoration:underline;color:#2D2D2D !important; }
  .h p a { text-decoration:underline;color:#595959 !important; }
  .h2 p a { text-decoration:underline;color:#595959 !important; }
  .h3 p a { text-decoration:underline;color:#595959 !important; }
  .j { border-top:3px solid #DFD150; }
  .k p { padding-left:15px;padding-bottom:0px;padding-top:6px;mso-margin-to=
p-alt:6px;mso-margin-bottom-alt:0px;mso-margin-left-alt:15px; }
  .o { background-color:#FFFFFF;border:1px solid #F1F1F1;border-radius:5px;=
 }
  .o p { font-family:'Helvetica',Arial,sans-serif;padding:0px;margin:0px; }
  .l p,
  .l p a { font-size:14px;line-height:20px;font-weight: bold;color:#2D2D2D;=
padding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .m p,
  .m p a { font-size:13px;line-height:18px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .n p,
  .n p a { font-size:12px;line-height:17px;font-weight:400;color:#2D2D2D;pa=
dding-bottom:6px;mso-margin-bottom-alt:6px;text-decoration:none; }
  .p { background-color:#FFFFFF;max-width:520px;border:1px solid #E1E8ED;bo=
rder:1px solid rgba(80, 80, 80, 0.3);border-radius:5px; }
  .q { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !impo=
rtant;border:1px solid #e1e8ed;border:1px solid rgba(80, 80, 80, 0.3);borde=
r-radius:5px;background-color:#FFFFFF; }
  .q p { font-size:16px;font-family:Helvetica,Roboto,Calibri,sans-serif !im=
portant;color:#222222; }
  .r { border:1px solid #E1E8ED !important;border-radius:5px; }
  .s p { font-size: 14px; line-height: 17px; font-weight: 400; color: #6978=
82; text-decoration: none; }
  .t p { font-family:'Helvetica',Arial,sans-serif;font-size:12px;line-heigh=
t:18px;font-weight:400;color:#000000;font-style:italic;padding:4px 0px 0px;=
}
  .v { border-radius:10px;border:solid 0px #438ac9;background-color:#438ac9=
;font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF; }
  .v a { text-decoration:none;display:block;color:#FFFFFF; }
  .w p { font-size:12px;line-height:15px;font-weight:400;color:#FFFFFF; }
  .w p a { text-decoration: underline !important;color:#FFFFFF !important; =
}
  ul { font-family:'Helvetica',Arial,sans-serif;margin:0px 0px 0px 25px !im=
portant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:di=
sc;font-size:16px; }
  ul li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
disc; }
  ol { font-family:'Helvetica',Arial,sans-serif;margin: 0px 0px 0px 25px !i=
mportant;padding:0px !important;color:#2D2D2D;line-height:24px;list-style:d=
ecimal;font-size:16px; }
  ol li { font-family:'Helvetica',Arial,sans-serif;margin:10px 0px 0px 0px =
!important;padding: 0px 0px 0px 0px !important; color: #2D2D2D; list-style:=
decimal; }
  .e h3,
  .e p,
  .e span { padding-bottom:0px;padding-top:0px;mso-margin-top-alt:0px;mso-m=
argin-bottom-alt:0px; }
  .e span,
  .e li { font-family:'Helvetica',Arial,sans-serif;font-size:16px;color:#2D=
2D2D;line-height:24px; }
  .rec { font-family:  ui-sans-serif, system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-ser=
if, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color E=
moji" !important; }
  .rec__button:hover { background-color: #f9fafb !important; }
  .copyright a {color: inherit !important; text-decoration: none !important=
; font-size: inherit !important; font-family: inherit !important; font-weig=
ht: inherit !important; line-height: inherit !important;}
  .txt_social p { padding: 0; }
  @media only screen and (max-width:667px) {
    .aa { width: 100% !important; }
    .bb img { width: 100% !important; height: auto !important; max-width: n=
one !important; }
    .cc { padding: 0px 8px !important; }
    .ee { padding-top:10px !important;padding-bottom:10px !important; }
    .ff ul, .ff ol { margin: 0px 0px 0px 10px !important;padding: 0px !impo=
rtant; }
    .ff li { margin:10px 0px 0px 10px !important; }
    .r {height:140px !important;}
    .s p { font-size:13px !important;line-height:15px !important; }
    .mob-hide {display:none !important;}
    .mob-stack {display:block !important;width:100% !important;}
    .mob-block {display:block !important;}
    .embed-img {padding:0px 0px 12px 0px !important;}
    .socialShare {padding-top:15px !important;}
    .rec { padding-left:15px!important;padding-right:15px!important; }
    .bodyWrapper { padding:10px 4px 10px 4px !important; }
  }
  @media screen and (max-width: 480px) {
    u + .a .gg { width: 100% !important; width: 100vw !important; }
    .tok-heart { padding-top:75% !important; }
    .tok-play { padding-top: 250px !important; }
  }
  @media screen and (max-width: 320px) {
    .tok-heart { padding-top:65% !important; }
  }
  .u { border: 1px solid #CACACA !important; border-radius: 2px !important;=
 background-color: #ffffff !important; padding: 0px 13px 0px 13px !importan=
t; font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,"Se=
goe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif !important;fon=
t-size: 12px !important; color: #767676 !important; }
  .u a { text-decoration: none; display: block !important; color: #767676 !=
important; margin: 0px !important; }
  .u span, .u img { color: #767676 !important;margin:0px !important; max-he=
ight:32px !important;background-color:#ffffff !important; }
</style><!--[if mso]><style type=3D"text/css">
    sup { font-size: 100% !important;vertical-align: .5em !important;mso-te=
xt-raise: -1.5% !important;line-height: 0 !important; }
    ul { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ul li { margin-left: 0px !important; mso-special-format: decimal; }
    ol { margin-left:0px !important; margin-right:10px !important; margin-t=
op:20px !important; margin-bottom:20px !important; }
    ol li { margin-left: 0px !important; mso-special-format: decimal; }
    li.listItem { margin-left:15px !important; margin-top:0px !important; }
    .paddingDesktop { padding: 10px 0 !important; }
    .edm_outlooklist { margin-left: -20px !important; }
    .embedImage { display:none !important; }
  </style><![endif]--></head><body class=3D"a" style=3D"margin:0px auto;pad=
ding:0px;word-wrap:normal;word-spacing:normal;background-color:#f5f5f5;"><d=
iv role=3D"article" aria-roledescription=3D"email" aria-label=3D"email_name=
" lang=3Den style=3D"font-size:1rem"><div style=3D"display:none;max-height:=
0px;overflow:hidden;"> International Conference on Sustainable Energy Educa=
tion &#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160=
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#=
160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204=
;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8=
204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;=
&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#82=
04;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&=
#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#16=
0;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&=
#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#820=
4;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#=
8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160=
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#=
160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204=
;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8=
204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;=
&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#82=
04;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&=
#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#16=
0;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&=
#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#820=
4;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#=
8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160=
;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#=
160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204=
;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8=
204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;=
&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#1=
60;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;=
&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#82=
04;&#160;&#8204;&#160;&#8204;&#160;&#8204;&#160;&#8204; </div><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" align=3D"center" ce=
llpadding=3D"0" class=3D"gg"><tr><td align=3D"center" valign=3D"top"><table=
 role=3D"none" width=3D"670" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" class=3D"aa" style=3D"width:670px;table-layout:fixed;"><tr><td class=3D"=
bodyWrapper" align=3D"center" valign=3D"top" style=3D"padding:10px 5px 10px=
 5px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"top" s=
tyle=3D"border:0px solid #FFFFFF;border-radius:10px;background-color:#fffff=
f;" class=3D"c"><table role=3D"none" width=3D"100%" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"f" align=3D"rig=
ht" valign=3D"top" style=3D"padding:20px 15px;"><p> January 22, 2024 &nbsp;=
 | &nbsp; <a href=3D"https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_A=
jv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-dgfz7LEB-Q9pyQHbb20KbDktVYABfP=
EF8zuh5kmllC5qkPplSPi-M-7taXEXPYQllNog9O1ygMUrCGndEfByxKm2zuv9eY4D1Td5Vi00v=
24gY1ODEOYBWd4W9N1qZhxsxUPHGnipsRPO4zT1RmxzgUVCRjUeTYLtRL5eyYcRoOqjDm-jQwDX=
PugLgh6i14w6nUeALOjX9V94U4vF4gSbyfBYR3W5-vhonyiz0mVdnA4J-gY3cwh-X99qfDFQSWf=
lUsUKee9XmMq2jvxIpkzMhojfHNGFq2xwRl-3j-9jVZLn5ELn1yKWp4FU_m9cRKvfbHNBg0dIcN=
q1b3T8CAbcvGeZzifr6TTxzgXI0Arzh2sDrqAMkR48S48zKcVSHQ3DEd7kQSQvsjnjsmWKsA77K=
EbBacYJTxkC7Yg51naf45--MTKwUFRjne2hn7ZnYURdoIIy7wiQBFMiqTgDe0dQhFjPvXUDCSVN=
eT0_BR-60H3H_wrMCvt-TCMH5PlyFOOXVIzer4WEIDy-8KoqxR_LKek2-bfMe6Chw0GIA0cahF4=
cUdbGmR2AS69xFPyxUgBgonXyZM3JfXqU-NJu0FTiSVylvEqP3xy_Ln7iWMZFV_k/437/e9fuRh=
14Q6-svuwZFExOBw/h0/7WnBA3NP5TzZ8hQtFCC9vRruqE2q9T9ILI60hHuWbM0">Read Onlin=
e</a></p></td></tr><tr><td style=3D"height:0px;width:0px;"><div style=3D"he=
ight:1px;" data-open-tracking=3D"true"> <img src=3D"https://link.mail.beehi=
iv.com/ss/o/hZ_JlIqIIa_woP0TRrumGA/437/e9fuRh14Q6-svuwZFExOBw/ho.gif" alt=
=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;=
width:1px !important;border-width:0 !important;margin-top:0 !important;marg=
in-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;p=
adding-top:0 !important;padding-bottom:0 !important;padding-right:0 !import=
ant;padding-left:0 !important;"/> </div></td></tr><tr id=3D"content-blocks"=
><td class=3D"email-card-body" align=3D"center" valign=3D"top" style=3D"pad=
ding-bottom:15px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"dd" align=3D=
"center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;=
"><p></p></td></tr><tr><td align=3D"center" valign=3D"top" style=3D"padding=
: 0px 15px 0px; " class=3D"dd"><table role=3D"none" border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td align=3D"=
center" valign=3D"top" style=3D"width:630px;"><a href=3D"https://link.mail.=
beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9R=
Ku4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alof=
QGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0l8DsGbw-lQSTfDv_wX56GcwvOVru2MxDv16Sd=
71oUMw/437/e9fuRh14Q6-svuwZFExOBw/h1/8u3nGpYGla5-LHjaOYgmOiVZNTPxU2-4ppgylN=
j60Is" rel=3D"noopener noreferrer nofollow" style=3D"text-decoration:none;"=
 target=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=
=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/f=
ile/d3243fed-ffdc-40b5-93e8-7ee15101b085/header-new.jpg?t=3D1705687928" alt=
=3D"" height=3D"auto" width=3D"630" style=3D"display:block;width:100%;" bor=
der=3D"0"/></a></td></tr></table></td></tr><tr><td class=3D"dd" align=3D"ce=
nter" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><spa=
n style=3D"color:rgb(232, 25, 90);font-family:Arial;font-size:36px;">Intern=
ational Conference on Sustainable Energy Education</span></h1></td></tr><tr=
><td id=3D"july-3-5-2024-valencia-spain" class=3D"dd" align=3D"center" vali=
gn=3D"top" style=3D"padding:0px 15px;text-align:center;"><h3><span style=3D=
"color:rgb(67, 138, 201);font-family:Arial;font-size:24px;">July 3 - 5, 202=
4. Valencia, Spain</span></h3></td></tr><tr><td align=3D"center" valign=3D"=
top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padd=
ing-top:14px;text-align:center;width:100%;word-break:break-word;" class=3D"=
dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" heig=
ht=3D"52" style=3D"height:52px;"><a href=3D"https://link.mail.beehiiv.com/s=
s/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9RKu4epSYGkYa9q=
gU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alofQGTlZ6nL6_pzi=
1m2retIuYI2iqY4pqcTb3SIY0l8DsGbw-lQSTfDv_wX56GcwvOVru2MxDv16Sd71oUMw/437/e9=
fuRh14Q6-svuwZFExOBw/h2/3RNs5ED5y01iK7i6oE62_iPxXLOrGc7QbV1ShcQSmrA" target=
=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;fon=
t-size:18px;padding:0px 22px;text-decoration:none;"> Visit seedconference.e=
u </a></td></tr></table></td></tr><tr><td align=3D"center" valign=3D"top" s=
tyle=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=3D"none" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;">=
<tr><td align=3D"center" valign=3D"top" style=3D"width:630px;"><a href=3D"h=
ttps://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L=
9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C1JVetpG8y-PdpbIg=
nAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8eQM_MyPpQ3PZeNs_=
lNfNk3x3bWHQHVQ9XQN38DeP_jj7EkkCSHLuby6e8_Aw/437/e9fuRh14Q6-svuwZFExOBw/h3/=
4bKpLKHjU42jKEub2IB7WvS5cWhgSvpmTeLm3Le7mAA" rel=3D"noopener noreferrer nof=
ollow" style=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https:=
//media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3D=
redirect,quality=3D80/uploads/asset/file/b22f2eca-65c9-42e3-adba-535a2d494d=
69/hero-new3.jpg?t=3D1705687947" alt=3D"" height=3D"auto" width=3D"630" sty=
le=3D"display:block;width:100%;" border=3D"0"/></a></td></tr></table></td><=
/tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"backg=
round-color:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd=
" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:cent=
er;"><h1><span style=3D"color:#e8195a;">In this newsletter:</span></h1></td=
></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" widt=
h=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr>=
<td bgcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0=
px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" style=3D"padding:0=
px 15px;text-align:center;word-break:break-word;"><p><span style=3D"color:#=
e8195a;">Click on the section below to read more:</span></p></td></tr></tab=
le></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td width=3D"100%"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"v=
ertical-align:top;" class=3D"mob-stack"><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"d=
d" align=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:=
break-word;"><p><span style=3D"color:#e8195a;"><b>Call for Papers</b></span=
><br><span style=3D"color:#e8195a;"><a class=3D"link" href=3D"#scope" rel=
=3D"noopener noreferrer nofollow" clicktracking=3D"off">Scope</a></span><br=
><span style=3D"color:#e8195a;"><a class=3D"link" href=3D"#topicsofinterest=
" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">Topics of inte=
rest</a></span><br><span style=3D"color:#e8195a;"><a class=3D"link" href=3D=
"#importantdates" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off=
">Important dates</a></span></p></td></tr></tbody></table></td><td width=3D=
"50%" style=3D"vertical-align:top;" class=3D"mob-stack"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><t=
r><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:ce=
nter;word-break:break-word;"><p><span style=3D"color:#e8195a;"><b>Call for =
Workshops</b></span><br><span style=3D"color:#e8195a;"><a class=3D"link" hr=
ef=3D"#reviewcriteria" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off">Review criteria</a></span><br><span style=3D"color:#e8195a;"><a cl=
ass=3D"link" href=3D"#proposalguidelines" rel=3D"noopener noreferrer nofoll=
ow" clicktracking=3D"off">Proposals guidelines</a></span><br><span style=3D=
"color:#e8195a;"><a class=3D"link" href=3D"#importantdates-2" rel=3D"noopen=
er noreferrer nofollow" clicktracking=3D"off">Important dates</a></span></p=
></td></tr></tbody></table></td></tr></table></td></tr></table></td></tr></=
table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent=
" style=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table ro=
le=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px =
15px;text-align:center;"><h1><span style=3D"color:#438ac9;">SEED 2024: Call=
 for Papers</span></h1></td></tr></table></td></tr></table></td></tr><tr><t=
d id=3D"scope" class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddin=
g:0px 15px;text-align:center;"><h2>Scope</h2></td></tr><tr><td class=3D"dd"=
 align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-=
word;"><p> The<b> First International Conference on Sustainable Energy Educ=
ation (SEED)</b> aims to become a forum for researchers, academics, and pra=
ctitioners to exchange ideas, experiences, opinions, and research results r=
elating to the preparation of students, teaching/learning methodologies, th=
e organization of educational systems, partnerships and funding and governa=
nce related to Sustainable Energy Education. </p></td></tr><tr><td class=3D=
"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:br=
eak-word;"><p> The <b>SEED</b> conference will be held on <b>July 3-5, 2024=
</b>, at the <b>Faculty of Business Administration and Management of the Un=
iversitat Polit=C3=A8cnica de Val=C3=A8ncia (UPV)</b>, which has been ranke=
d as the best technical university in Spain by the Academic Ranking of Worl=
d Universities since 2014. </p></td></tr><tr><td><table id=3D"topicsofinter=
est" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#E=
FF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"ce=
nter" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><spa=
n style=3D"">Topics of interest</span></h2></td></tr></table></td></tr></ta=
ble></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" styl=
e=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td c=
lass=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-b=
reak:break-word;"><p><span style=3D"">The Program Committee encourages the =
submission of extended abstracts that communicate applied and empirical fin=
dings of interest to higher education and vocational education & training p=
rofessionals, researchers, and practitioners.</span><br><span style=3D"">Ke=
y topics include, but are not limited to, the following subjects:</span></p=
></td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none"=
 width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""=
><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px =
0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td width=3D"100%"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D=
"50%" style=3D"vertical-align:top;" class=3D"mob-stack"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><t=
r><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left=
;word-break:break-word;"><p><span style=3D""><b>Track 1: Teaching and Learn=
ing on Sustainable Energy Education.</b></span><br><span style=3D""><i>Good=
 practices related to:</i></span></p></td></tr><tr><td style=3D"padding-bot=
tom:12px;padding-left:37px;padding-right:27px;padding-top:12px;" class=3D"e=
e"><div style=3D"margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"l=
ist-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"l=
istItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-wo=
rd;"><span style=3D"">Renewable energy sources and their development, use, =
and impact</span></p></li><li class=3D"listItem ultext"><p style=3D"padding=
:0px;text-align:left;word-break:break-word;"><span style=3D"">Development a=
nd use of electric vehicles and the connection to the economy and the envir=
onment</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px=
;text-align:left;word-break:break-word;"><span style=3D"">Efficient use of =
energy technologies for conservation and reduction of waste</span></p></li>=
<li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-=
break:break-word;"><span style=3D"">Nature-Based Solutions (NBS)</span></p>=
</li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;=
word-break:break-word;"><span style=3D"">Circular Economy models</span></p>=
</li></ul></div></td></tr></tbody></table></td><td width=3D"50%" style=3D"v=
ertical-align:top;" class=3D"mob-stack"><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"d=
d" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:brea=
k-word;"><p><span style=3D""><b>Track 2: Partnerships, Collaboration on Sus=
tainable Energy Education </b></span><br><span style=3D""><i>Good practices=
 related to:</i></span></p></td></tr><tr><td style=3D"padding-bottom:12px;p=
adding-left:37px;padding-right:27px;padding-top:12px;" class=3D"ee"><div st=
yle=3D"margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"list-style-=
type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listItem ul=
text"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span=
 style=3D"">Traineeships & apprenticeships</span></p></li><li class=3D"list=
Item ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;=
"><span style=3D"">Energy career and workforce development in the energy in=
dustry</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px=
;text-align:left;word-break:break-word;"><span style=3D"">Synthesis of ener=
gy information</span></p></li><li class=3D"listItem ultext"><p style=3D"pad=
ding:0px;text-align:left;word-break:break-word;"><span style=3D"">HUBS in s=
ustainable energy</span></p></li><li class=3D"listItem ultext"><p style=3D"=
padding:0px;text-align:left;word-break:break-word;"><span style=3D"">Skill =
needs of the labor market</span></p></li></ul></div></td></tr></tbody></tab=
le></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td>=
<table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadd=
ing=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:=
#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"100%"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
"><tr><td width=3D"50%" style=3D"vertical-align:top;" class=3D"mob-stack"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tbody><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15=
px;text-align:left;word-break:break-word;"><p><span style=3D""><b>Track 3: =
Governance & Funding for Sustainable Energy Education</b></span><br><span s=
tyle=3D""><i>Good practices related to:</i></span></p></td></tr><tr><td sty=
le=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;padding-top:=
12px;" class=3D"ee"><div style=3D"margin-left:0px;" class=3D"edm_outlooklis=
t"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px=
;"><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;wo=
rd-break:break-word;"><span style=3D"">Financing models</span></p></li><li =
class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-brea=
k:break-word;"><span style=3D"">Financial tools </span></p></li><li class=
=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:bre=
ak-word;"><span style=3D"">Financing partnerships in energy</span></p></li>=
<li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-=
break:break-word;"><span style=3D"">Business models for energy education</s=
pan></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-ali=
gn:left;word-break:break-word;"><span style=3D"">University spin-offs</span=
></p></li></ul></div></td></tr></tbody></table></td><td width=3D"50%" style=
=3D"vertical-align:top;" class=3D"mob-stack"><table role=3D"none" width=3D"=
100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=
=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break=
:break-word;"><p><span style=3D""><b>Track 4: Sustainable Education </b></s=
pan><br><span style=3D""><i>Good practices related to:</i></span></p></td><=
/tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27=
px;padding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;" class=3D=
"edm_outlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:=
0px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px;tex=
t-align:left;word-break:break-word;"><span style=3D"">Competency-based lear=
ning and skill assessment</span></p></li><li class=3D"listItem ultext"><p s=
tyle=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"=
">Education accreditation, quality, and assessment</span></p></li><li class=
=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:bre=
ak-word;"><span style=3D"">Innovative materials and new tools for teaching<=
/span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-a=
lign:left;word-break:break-word;"><span style=3D"">Teaching and learning ex=
periences</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:=
0px;text-align:left;word-break:break-word;"><span style=3D"">Educational te=
chnology (e.g., virtual labs, e-learning) </span></p></li></ul></div></td><=
/tr></tbody></table></td></tr></table></td></tr></table></td></tr></table><=
/td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"=
background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" wid=
th=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=
=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;p=
adding-right:15px;padding-top:14px;text-align:center;width:100%;word-break:=
break-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"=
0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" =
valign=3D"middle" height=3D"52" style=3D"height:52px;"><a href=3D"https://l=
ink.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mszuoN1=
yA3Jgho2bXfGfrQUhLLKabviJfrip-rYP96kA-VBSI8kiBGDdpfbj01i8em0e2HYj3ycF7PU6tr=
mWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU-3UNsujR0_ju2grTEiENyJE5OihvGbIwMq89fAJzUx6=
l27z20SbJpX_gQuix-tFCaxv1JmPf8uOCSdo/437/e9fuRh14Q6-svuwZFExOBw/h4/KhjH51fe=
oVCexq_3-uXW-r3DxjEFEXdUt1oR0Hok4do" target=3D"_blank" rel=3D"noopener nore=
ferrer nofollow" style=3D"color:#FFFFFF;font-size:18px;padding:0px 22px;tex=
t-decoration:none;"> Read More </a></td></tr></table></td></tr></table></td=
></tr></table></td></tr><tr><td><table id=3D"importantdates" role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"">=
<tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0=
px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"to=
p" style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D"color:#=
e8195a;">Important dates</span></h2></td></tr></table></td></tr></table></t=
d></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"ba=
ckground-color:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D=
"center" valign=3D"top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><tab=
le role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"=
margin:0 auto 0 auto;"><tr><td align=3D"center" valign=3D"top" style=3D"wid=
th:567px;"><img src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-=
down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/51962=
d97-3955-4ca5-9ffc-05ac39f2baee/new-dates.jpg?t=3D1705687134" alt=3D"" heig=
ht=3D"auto" width=3D"567" style=3D"display:block;width:100%;" border=3D"0"/=
></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"background-colo=
r:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" alig=
n=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><=
h1><span style=3D"color:#438ac9;">SEED 2024: Call for Workshops</span></h1>=
</td></tr></table></td></tr></table></td></tr><tr><td class=3D"dd" align=3D=
"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p=
><span style=3D"font-size:16px;">Researchers, academics, and practitioners =
are invited to submit proposals for workshops at the=C2=A0</span><span styl=
e=3D"font-size:16px;"><b>SEED conference</b></span><span style=3D"font-size=
:16px;">. The purpose of workshops is to give room for presenting ideas and=
 discussing preliminary results in an interactive atmosphere while focusing=
 on a specific topic. Workshops may be proposed for=C2=A0</span><span style=
=3D"font-size:16px;"><b>a minimum of 1.5 hours and a maximum of 3 hours in =
length</b></span><span style=3D"font-size:16px;">. It should encourage live=
ly debates and stimulate the production of new ideas and the discussion of =
controversial issues.</span></p></td></tr><tr><td id=3D"reviewcriteria" cla=
ss=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-al=
ign:center;"><h2>Review criteria</h2></td></tr><tr><td class=3D"dd" align=
=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"=
><p><span style=3D"font-size:16px;">The decision on acceptance or rejection=
 of a workshop proposal will be made</span><span style=3D"font-size:16px;">=
<b> based on the overall quality</b></span><span style=3D"font-size:16px;">=
=C2=A0of the proposal and its potential to attract a sufficiently broad com=
munity.=C2=A0</span></p></td></tr><tr><td><table id=3D"proposalguidelines" =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7=
;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0"=
 cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" =
valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><span styl=
e=3D"">Proposal guidelines</span></h2></td></tr></table></td></tr></table><=
/td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"=
background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" wid=
th=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=
=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break=
:break-word;"><p><span style=3D""><b>All workshop proposals should be sent =
to=C2=A0</b></span><span style=3D""><b><a class=3D"link" href=3D"mailto:see=
dconf@upv.es" target=3D"_blank" rel=3D"noopener noreferrer nofollow" clickt=
racking=3D"off">seedconf@upv.es</a></b></span><span style=3D"">=C2=A0</span=
><span style=3D""><b>in English</b></span><span style=3D""> as a single PDF=
 file (2-6 pages) containing the following sections:</span></p></td></tr><t=
r><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;pad=
ding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;" class=3D"edm_o=
utlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0p=
x 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px;text-alig=
n:left;word-break:break-word;"><span style=3D"font-size:12px;">Title and ac=
ronym.</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px=
;text-align:left;word-break:break-word;"><span style=3D"font-size:12px;">Ab=
stract: 150-200 word abstract describing the workshop purpose.</span></p><u=
l style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><l=
i class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-br=
eak:break-word;"><span style=3D"font-size:12px;">Objectives: a clear descri=
ption of the workshop objectives.=C2=A0</span></p></li><li class=3D"listIte=
m ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><=
span style=3D"font-size:12px;">Description of the topics and scope of the w=
orkshop.</span></p></li></ul></li><li class=3D"listItem ultext"><p style=3D=
"padding:0px;text-align:left;word-break:break-word;"><span style=3D"font-si=
ze:12px;">Organizer: a short biographical sketch of the workshop organizer,=
 describing relevant experience and qualifications.</span></p></li><li clas=
s=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:br=
eak-word;"><span style=3D"font-size:12px;">Intended audience: description o=
f the anticipated audience, including experience level and prerequisites, t=
he expected number of participants to the workshop and how the workshop org=
anizer will call for participation.</span></p></li><li class=3D"listItem ul=
text"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span=
 style=3D"font-size:12px;">Rough agenda: 1-page outline of the workshop con=
tent describing the workshop dynamics, including tentative speakers, format=
 (panels, call for extended abstracts, etc).</span></p><ul style=3D"list-st=
yle-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listIte=
m ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><=
span style=3D"font-size:12px;">If the workshops consist of the selection & =
publication of =E2=80=9Cextended abstracts=E2=80=9D (this is only a possibi=
lity):</span></p><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0=
px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px;text=
-align:left;word-break:break-word;"><span style=3D"font-size:12px;">Tentati=
ve dates</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0=
px;text-align:left;word-break:break-word;"><span style=3D"font-size:12px;">=
Review process=C2=A0</span></p></li><li class=3D"listItem ultext"><p style=
=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"font=
-size:12px;">Publication opportunities=C2=A0</span></p></li></ul></li></ul>=
</li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;=
word-break:break-word;"><span style=3D"font-size:12px;">Infrastructure: Des=
cription of the infrastructure needed to carry out the workshop.</span></p>=
</li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;=
word-break:break-word;"><span style=3D"font-size:12px;">Statement from the =
organizers willing to publish an extended abstract of the findings of the w=
orkshop (Final version submission deadline July 28, 2024)</span></p></li><l=
i class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-br=
eak:break-word;"><span style=3D"font-size:12px;">Maximum capacity of attend=
ees=C2=A0</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:=
0px;text-align:left;word-break:break-word;"><span style=3D"font-size:12px;"=
>Other information: For instance, information that will let attendees know =
more about your workshop.</span></p></li></ul></div></td></tr></table></td>=
</tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E=
FF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table r=
ole=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;padd=
ing-left:15px;padding-right:15px;padding-top:14px;text-align:center;width:1=
00%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" al=
ign=3D"center" valign=3D"middle" height=3D"52" style=3D"height:52px;"><a hr=
ef=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjo=
AkkAh3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7L=
jMsdzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79=
zXOXhPaMST4f8GKuaS1MjOlNCpuaKfP_Nz_6gnPQ7Apk7ulXUYk/437/e9fuRh14Q6-svuwZFEx=
OBw/h5/EKDBnPI_kf7D-rjKiu6DZzjI64H4A9nxWH8XaB4BVIc" target=3D"_blank" rel=
=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:18px;pad=
ding:0px 22px;text-decoration:none;"> Read more </a></td></tr></table></td>=
</tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0p=
x 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0"><tr><td width=3D"100%"><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" st=
yle=3D"vertical-align:top;" class=3D"mob-stack"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td c=
lass=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-b=
reak:break-word;"><p><span style=3D""><b>Resources provided by the SEED org=
anizing committee:</b></span></p></td></tr><tr><td style=3D"padding-bottom:=
12px;padding-left:37px;padding-right:27px;padding-top:12px;" class=3D"ee"><=
div style=3D"margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"list-=
style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listI=
tem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"=
><span style=3D"">A link on the SEED website.</span></p></li><li class=3D"l=
istItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-wo=
rd;"><span style=3D"">Management of registration for participants.</span></=
p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:lef=
t;word-break:break-word;"><span style=3D"">Setup of meeting space and relat=
ed equipment.</span></p></li></ul></div></td></tr></tbody></table></td><td =
width=3D"50%" style=3D"vertical-align:top;" class=3D"mob-stack"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tbody><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-al=
ign:left;word-break:break-word;"><p><span style=3D""><b>The workshop organi=
zer must take care of the following:</b></span></p></td></tr><tr><td style=
=3D"padding-bottom:12px;padding-left:37px;padding-right:27px;padding-top:12=
px;" class=3D"ee"><div style=3D"margin-left:0px;" class=3D"edm_outlooklist"=
><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"=
><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word=
-break:break-word;"><span style=3D"">Coordinating schedules and deadlines w=
ith the SEED organizing committee.</span></p></li><li class=3D"listItem ult=
ext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span =
style=3D"">Provide a brief description of the workshop for inclusion in the=
 SEED website and the workshop program when it is final.=C2=A0</span></p></=
li></ul></div></td></tr></tbody></table></td></tr></table></td></tr></table=
></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14p=
x;padding-left:15px;padding-right:15px;padding-top:14px;text-align:center;w=
idth:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=
=3D"v" align=3D"center" valign=3D"middle" height=3D"52" style=3D"height:52p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooV=
UgQpQHcjoAkkAh3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51=
cmgsHyd7LjMsdzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X=
6bQK9ws79zXOXhPaMST4f8GKuaS1MjOlNCpuaKfP_Nz_6gnPQ7Apk7ulXUYk/437/e9fuRh14Q6=
-svuwZFExOBw/h6/U5EvepyPH-rcshwYckZzRxAKvrpho9PT3g-dSfxji1U" target=3D"_bla=
nk" rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:1=
8px;padding:0px 22px;text-decoration:none;"> Read more </a></td></tr></tabl=
e></td></tr></table></td></tr></table></td></tr><tr><td><table id=3D"import=
antdates-2" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-c=
olor:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
2><span style=3D"color:#e8195a;">Important dates</span></h2></td></tr></tab=
le></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding: 0px 15px =
0px; " class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td align=3D"center" val=
ign=3D"top" style=3D"width:567px;"><img src=3D"https://media.beehiiv.com/cd=
n-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/=
uploads/asset/file/e0cd1559-3afa-4178-95fa-cf6bae4f034b/Schermata_2023-12-2=
1_alle_00.06.14.png?t=3D1703113598" alt=3D"" height=3D"auto" width=3D"567" =
style=3D"display:block;width:100%;" border=3D"0"/></td></tr></table></td></=
tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"#2466A1" style=3D"background-color:#2466A1;padding:20px 0px 3=
0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" style=3D"padding:=
0px 15px;text-align:center;word-break:break-word;"><p><span style=3D"color:=
rgb(255, 255, 255);font-size:14px;"><b>Remember, your workshop proposal sho=
uld be sent by e-mail=C2=A0</b></span><br><span style=3D"color:rgb(255, 255=
, 255);font-size:14px;"><b>by February 2, 2024 to =C2=A0</b></span><span st=
yle=3D"color:rgb(255, 255, 255);font-size:14px;"><b><a class=3D"link" href=
=3D"mailto:seedconf@upv.es" target=3D"_blank" rel=3D"noopener noreferrer no=
follow" clicktracking=3D"off">seedconf@upv.es</a></b></span><span style=3D"=
color:rgb(255, 255, 255);font-size:14px;"><b>.</b></span></p></td></tr></ta=
ble></td></tr></table></td></tr><tr><td class=3D"dd" align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p></p></td></=
tr></table></td></tr><tr><td class=3D"b" align=3D"center" valign=3D"top" bg=
color=3D"#438ac9" style=3D"padding:0px;border-bottom-left-radius:10px;borde=
r-bottom-right-radius:10px;"><table role=3D"none" width=3D"100%" border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"ce=
nter" valign=3D"top" bgcolor=3D"#fbbb16" style=3D"padding:12px"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" a=
lign=3D"center"><tr><td><span style=3D"padding-left:1px;"></span></td><td a=
lign=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;"><a hre=
f=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19n_meO0wke5FKB=
zflRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDPCB6z8vhEMnt0zgr_0xSB8mCA7I4_IzXxUL0B=
xvwowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0VoOTWsxhjeXzv6N0rcNwQKxEIDje94i_A07SYh=
bJ8C0ZFVrGcrxLBaCewCABf0qPGpA/437/e9fuRh14Q6-svuwZFExOBw/h7/RITyvpDdsTLgo54=
hTC0EVcAPq_G2wXvJbQpDv_1iORs" style=3D"text-decoration:none;"><img width=3D=
"22" alt=3D"fb" border=3D"0" style=3D"display:block;max-width:22px;" src=3D=
"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,one=
rror=3Dredirect,quality=3D80/static_assets/facebook_light.png"/></a></td><t=
d align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;"><a =
href=3D"https://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2nMaT=
nkJ55jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j7f7=
sIGH2rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSpWd3=
zEBVTFR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw2Ox0MkZueO1pqv1rSPW1Sq/=
437/e9fuRh14Q6-svuwZFExOBw/h8/pLoxx8sxysoPuLrmV-NvhRkUZn2KYNL0_GRMj5ljjJs" =
style=3D"text-decoration:none;"><img width=3D"22" alt=3D"tw" border=3D"0" s=
tyle=3D"display:block;max-width:22px;" src=3D"https://media.beehiiv.com/cdn=
-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/s=
tatic_assets/x_light.png"/></a></td><td align=3D"center" valign=3D"middle" =
width=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com=
/ss/c/9F_3DQ7aZvovpc0Duh6W19-oP22J3WocJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9mwqi=
G-vvmwaV9DVnHpUEAKtXByiNzks-sZep-mXhtzqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZ=
NcfrRDKc7G3t7Nqn0zn2al0tT8c5m5gwuznVQ3mwgGhRQyVl2-ZSAdI4yFyh0IxFvNCYDA/437/=
e9fuRh14Q6-svuwZFExOBw/h9/IY5wUibXJu320ruNASxPgVINRlrskP-yBRxPdpkQ96w" styl=
e=3D"text-decoration:none;"><img width=3D"22" alt=3D"ig" border=3D"0" style=
=3D"display:block;max-width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi=
/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/stati=
c_assets/instagram_light.png"/></a></td><td align=3D"center" valign=3D"midd=
le" width=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.beehiiv=
.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrPSmgGRK74cEOs7Myre-gzzHjUdIlL=
DmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_XH4o1UZo-t6INhxP3gdAhU4tjDhIl=
BnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiDdaEEg90Du_iPonoBay0VGzc1b7LJ=
aZwSMKTf9SgyOpGrFjqk/437/e9fuRh14Q6-svuwZFExOBw/h10/l2xJAFYkGFhbaI4LvSgyASK=
MwktgZA2e5FL6GAzE8GM" style=3D"text-decoration:none;"><img width=3D"22" alt=
=3D"in" border=3D"0" style=3D"display:block;max-width:22px;" src=3D"https:/=
/media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dr=
edirect,quality=3D80/static_assets/linkedin_light.png"/></a></td><td><span =
style=3D"padding-left:1px;"></span></td></tr></table></td></tr><tr><td heig=
ht=3D"10" style=3D"line-height:1px;font-size:1px;height:10px;"> &nbsp; </td=
></tr><tr><td class=3D"w" align=3D"center" valign=3D"top" style=3D"padding:=
15px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"top"><=
p style=3D"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!important=
;"> Update your email preferences or unsubscribe <a class=3D"link" href=3D"=
https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b=
19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-E9LT=
lRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaDVCT7kusJtMG07ZWW3Q8=
4ymNBM7TF2ol9Y59w2Rt291RoT-wQdn-k7caRcSzILiaFZ6TWGVh1OwpqCwRlWJbMMd0YpNezzH=
-vTNLNnM2jbPaRKuWslvqin6IpFbviGeHvesTxFSOztd9TficD-UARbiB1lpTVr3Uie7k4jt4Bj=
inE_gmEZeuFZr3ZoQi2VKNLPSk9za7vUvw_J_nePaQylOz-G8hGiR17d4E4DvQ21s4CnkqRu7F5=
NBA0tVSzU0k1ORjgrwnyeR8LNH3i0pf96bIDvWGGYdxhlPUZseIYK7vtvxIlNE5Mho4RSDJD7AZ=
VdWd-EA-FnygIc69F9WeE_7xTJsB5hIkbjxdx1ByflD7hwakmabJdjfpcmVbXxoX6XVI6V60afu=
P5cSbL5eU6kgmjYdmguAkm5bf2nAmM2WiIxPCwYMDkfPsWoxPUlDyW__oKLIB79S95mFXx3ngnE=
KKrnxRasqEw4QWqoIH7KucBituCla4GNy1mxNAxTsevZ2GsEhmf6iXLxsl90w5k33N7iFSU91xW=
h7T6HK47EhA/437/e9fuRh14Q6-svuwZFExOBw/h11/fhOkxH8LXcGJmobIua1GBiZo2Kk6VLPN=
GuvitdLPii8" style=3D"text-decoration:underline;text-decoration-color:#FFFF=
FF!important;color:#FFFFFF!important;"> here</a></p><p class=3D"copyright" =
style=3D"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!important;"=
> &copy; 2024 SEED Conference 2024 - Valencia </p><p style=3D"font-family:'=
Arial',Helvetica,sans-serif;color:#FFFFFF!important;"> Universitat Polit=C3=
=A8cnica de Val=C3=A8ncia Camino de Vera<br>Valencia, Comunidad Valenciana =
46022 , Spain </p></td></tr><tr style=3D"display: table-row !important;"><t=
d align=3D"center" valign=3D"top" style=3D"padding-top:20px;" style=3D"disp=
lay:table-cell !important;"><table role=3D"none" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" align=3D"center" style=3D"display:table !important=
;"><tr style=3D"display:table-row !important;"><td class=3D"u" align=3D"cen=
ter" valign=3D"middle" height=3D"32" style=3D"height:32px;display:table-cel=
l !important; max-height: 32px !important;margin:0px !important;"><a style=
=3D"line-height:32px !important;text-decoration:none;display:block !importa=
nt;" href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1JVn=
HfTV-osXzaRbZV795ZdjDUhuArVGUSxbWEEFnvLBaltlHK7O4nZj6sMoVuY-gq31Rpr3nnHHnjE=
hxe4-6TrdYbp-ocQ-MpaLELThYytwFWcSJD86ks9O-0IzBJg46dSJ9KwzwEqgjEUXWaziEharUh=
qCgixzsb1tml-V6iU6YtUdSOnwwTUellpuhMg/437/e9fuRh14Q6-svuwZFExOBw/h12/iMmY94=
9OaIqFX8uXliuYH7f-AzODqpZsxAxdUswqXiw"><img src=3D"https://media.beehiiv.co=
m/output-onlinepngtools.png" width=3D"16" alt=3D"beehiiv logo" style=3D"dis=
play:inline-block !important;max-width:16px !important; vertical-align:-3px=
 !important;width: 16px !important;" border=3D"0"/><span style=3D"padding-l=
eft:11px !important;display: inline-block !important;">Powered by beehiiv</=
span></a></td></tr></table></td></tr></table></td></tr></table></td></tr></=
table></td></tr></table></td></tr></table></td></tr></table></div></body></=
html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/youHW_MfRX-4OFwLMgS9Uw%40geopod-ismtpd-32?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/youHW_MfRX-4OFwLMgS9Uw%40geopod-ismtpd-32</a>.<br />

--da720858b833882755ddb9c3fd3ffea35df763703c871595a4736d3b8c66--
