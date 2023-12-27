Return-Path: <jailhouse-dev+bncBAABBJNFWCWAMGQEFBDLPGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFC81EEBB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Dec 2023 13:03:51 +0100 (CET)
Received: by mail-pj1-x1040.google.com with SMTP id 98e67ed59e1d1-28c391d255dsf995595a91.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Dec 2023 04:03:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703678630; cv=pass;
        d=google.com; s=arc-20160816;
        b=ljtwBQSzWtIS/kZo0+dgGnoHtxQVwENnxmIswrZvdZdif+EMtZEY38fRyoFdAnkna5
         oIGhzFYAwhVdAwly8N7kAM05aI+m0s6yYzdyrlVYle/FWFU/kgfZdeGtU5DQk+AHD1Yb
         niEldU9CF+j15lKO9CwopzfJrO5GG2SY7QHdsDGLNRBvdZfSvVDtka7Z0hiQhRWzVwQa
         ikXYC2ZdTC4VgFM6Qeieip196+bK8vMQ4sND0+sHDwOVIBejHq11+FKKoj7IoeOEDFi9
         T7IPgKj/T92B9J6va3qOcr21ERLYgQ1l3POvJib9R5tklxBVV4fsIzVoFcXPSXHove0o
         NYwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:list-unsubscribe:feedback-id:sid
         :reply-to:subject:message-id:mime-version:from:date:dkim-signature;
        bh=uwRkz7yhoY4gZF/BLeDM5Afdtud8CD7WwXXHxeM/qfc=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=FV9luqLresKryIsaAPEtxGqhfFIACjWVj3/FZF+KkuqAIOkUDUQJWfVyTqQ/rrXZHa
         Xn+tsDT8EBacZInT2YnDInkhDAN16Q2F8VSTqQmXdF54OoJS8b3q58Zbsj+CHFyF6Dyq
         3twPFcGUYoll9drPVikrKkfQ+tfbVYO+7p2yMQVB7gLTIOGEMHwPvCqoHWohz1pbUEys
         RNxWRIYqOYQ3goY3wX+TJLgpZGHGpoY1BR8ERV2jj78dBn7zwQze2JEskUe7/LGgAkKM
         bY4PREQ/0mCbyE4kn8lssAOx+IJPluRQ297e3hrDkt7ZVgZkCx0I3MeLqgvYkNC/GCqN
         ziMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=fxAJJ5GX;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.192 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1703678630; x=1704283430; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:list-unsubscribe:feedback-id:sid:reply-to
         :subject:message-id:mime-version:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwRkz7yhoY4gZF/BLeDM5Afdtud8CD7WwXXHxeM/qfc=;
        b=IosSGv6dgnWcmFioHZQ+GKqXKVJTLSJD54PxDEXm6WtIbcgePNx44UJ78ZqOcNZfAo
         WjF6c/mT2bST1VjbnLm0twaY0bPGxIwY87fs+irtKKPiEA5kjmK2aI+jajSBtCh/mi1r
         BUnRJYcKztNycnkXpmy7DNc0QzkoheBLN0OKD1uN13JXRQF1K2iX1k8T0UNa5PrKcjUg
         cWlCwia1tuBlHiuJwemngXfzeRsUIdCcCcWB7OtAC5mt3tYoaoWgxumxzDG5WinfZk/8
         4Jj78G7i1Q4XnSMrqG4NHkgAUAV/gAQsrgYT8CqaAENbZKqoMdfPfhGqJZbYsdH6eNMC
         JYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703678630; x=1704283430;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to
         :list-unsubscribe:feedback-id:sid:reply-to:subject:message-id
         :mime-version:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwRkz7yhoY4gZF/BLeDM5Afdtud8CD7WwXXHxeM/qfc=;
        b=VXmR7JuC6Rsh+Rv/swQVnjP3cJBSdbAzZvzwH7MXbnYFR7l1SQG5MndS0aUvESP5q5
         i9TQev1YFeu3tdYt4fYXyVfI/w7zKprCCin1KwbmWKZvuhJsm8yitpb6VAB3e8cK8JXA
         lL+Dhs3fwqtA7YpB4ZgqxECVadNSy8UzYuWZi2jg/mohmJqNNUfbmUVOgBKZ16WFvFar
         XA5m3fp1lrrDDiZoJufZKykoxBDsXmMCKy+4yEQZdmzi2agMMclM65DA7M9YdbNdoLJy
         H8ypBFSp8r6UlyZmi/R4gLgXD0moGti2qc0PPo4TKzYQ5P06mnjkfM8UxRJGwyWLh/Es
         Sw6w==
X-Gm-Message-State: AOJu0Yz0Tty1GspKOPD7qH4Jbwd3yyy14sm+AGbaRSBTHcZTMRB04XJe
	rwHIefxFNR+JRJU4AyderuU=
X-Google-Smtp-Source: AGHT+IE8rPBdcUysWRSZxQ1xBZgb9A6H7INmMXEtfcMIGADDqHnaQ7JUpzzFtqXqvM2YTHL2bbvblA==
X-Received: by 2002:a17:90a:cc05:b0:28b:f97a:68cf with SMTP id b5-20020a17090acc0500b0028bf97a68cfmr2460875pju.82.1703678630143;
        Wed, 27 Dec 2023 04:03:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:b107:b0:28b:4cbe:7948 with SMTP id
 z7-20020a17090ab10700b0028b4cbe7948ls1803180pjq.0.-pod-prod-07-us; Wed, 27
 Dec 2023 04:03:48 -0800 (PST)
X-Received: by 2002:a17:90a:428c:b0:28b:dc0d:8b84 with SMTP id p12-20020a17090a428c00b0028bdc0d8b84mr2344209pjg.50.1703678628456;
        Wed, 27 Dec 2023 04:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703678628; cv=none;
        d=google.com; s=arc-20160816;
        b=oprzi8XFPV8tj23ummUC63HwZcskh7HTBcsm90fDhKT/umV6G6wsFJVdEOz4lpm0+v
         x9KijO7AsZ/NrIUdbux8g4wXUS9xmkeWc16pXEGRl7cHLBWCF0QpBT6lfYW/BgA98Z1+
         SUGw26r5pWhLoxD5g8/y3YfyhzAf9MOts6JnTKEl6kRR+PUpP+Tg2ShWOCHJ0Dylphod
         Sp3gHmDd9WWJJBpRBq0jkv0gPFTkTlY4n5bokNQZUtyIajBa9duN1fu+7n2J1gPpCZRq
         /AAmMoAdC8QNoCUv3NRNH5t4il35SmAnn2q15QjzIJe0tdauKYLBr7nCdbhJc50ibgby
         GPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:list-unsubscribe:feedback-id:sid:reply-to:subject:message-id
         :mime-version:from:date:dkim-signature;
        bh=NrR8w+ymRF/o+LPM6JET5dWbEItdAEl9kh7uzUpwI8Q=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=gqbUj+rg6WJoT+qyYx1iAf2mLocVP87pdmIRVptagbWp43+K/6kmmHoLt0vM4bzUkC
         xZMvQwActA2tjJ/nh21eyGCQ9kKE7yDaQWROvClkFGIigqTrGK2ICxuBkO8jn0DfhQRT
         PBzJxk71O28bcEWg/5MBXejgm5QBnM/Qy2lUbU9swRb2ZCY145DiguAZU45xFUcCReH9
         LozaKyM2t7BI1damwZB7uO7PfEcFIz0F7IvlTxbw1nsYjOAYCI39eb9No7BTx1s0e1Xl
         RrqeTpAMOsir/L5ye65PBlXqlRAh6RcvhPyqZCCuW5j+Y/7nS7fJDKUj3HQJ1LaYfTeJ
         5bxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=fxAJJ5GX;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.192 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
Received: from o16.ptr6223.mail.beehiiv.com (o16.ptr6223.mail.beehiiv.com. [159.183.141.192])
        by gmr-mx.google.com with ESMTPS id i20-20020a17090acf9400b0028b9449f816si995007pju.3.2023.12.27.04.03.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 04:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.192 as permitted sender) client-ip=159.183.141.192;
Received: by filterdrecv-655bd866f5-x7rtn with SMTP id filterdrecv-655bd866f5-x7rtn-1-658C1298-3
        2023-12-27 12:03:36.075244996 +0000 UTC m=+1368021.975363903
Received: from NDAzNDMyOTY (unknown)
	by geopod-ismtpd-5 (SG) with HTTP
	id hyxbG2epT4CDc5XYdEJ_2A
	Wed, 27 Dec 2023 12:03:36.020 +0000 (UTC)
Content-Type: multipart/alternative; boundary=dd12a6fe990891fefe193825d07c0093005878cfde324b6ca571a63a933a
Date: Wed, 27 Dec 2023 12:03:47 +0000 (UTC)
From: "'SEED Conference' via Jailhouse" <jailhouse-dev@googlegroups.com>
Mime-Version: 1.0
Message-ID: <hyxbG2epT4CDc5XYdEJ_2A@geopod-ismtpd-5>
Subject: Registration is open - SEED '24 Valencia
Reply-To: SEED Conference <seedconf@upv.es>
x-newsletter-signup: https://seed-conference-valencia.beehiiv.com/subscribe
x-beehiiv-ids: =?us-ascii?Q?{=22account=5Fname=22=3A=22https=3A=2F=2Fseed-conference-valencia=2Ebeehiiv=2Ecom=2F?=
 =?us-ascii?Q?=22=2C=22campaign=5Fid=22=3A=222206f665-87de-49ec-ac7?=
 =?us-ascii?Q?6-53a5cdf23892=22=2C=22category=22=3A=22newsletter=22?=
 =?us-ascii?Q?=2C=22email=5Fgenerated=5Fat=22=3A1703678615=2C=22user=5F?=
 =?us-ascii?Q?id=22=3A=2271fc7e6d-cd28-47c6-aa1e-5d673d88c2?=
 =?us-ascii?Q?8e=22}?=
sId: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-list-owner: <mailto:seedconf@upv.es>
x-beehiiv-type: newsletter
x-newsletter: https://seed-conference-valencia.beehiiv.com/p/newsletter-27-december-2023
Feedback-ID: =?us-ascii?Q?2206f665-87de-49ec-ac76-53a5cdf23892=3Anewsletter=3A71fc7e6d-cd28-?=
 =?us-ascii?Q?47c6-aa1e-5d673d88c28e=3A73c7af638dd0cac?=
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
x-list-id: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-newsletter-id: https://seed-conference-valencia.beehiiv.com/
X-SG-EID: =?us-ascii?Q?N+FhySnck2RAqxf=2F2q+C0uCc9fID1mnX8DhIspt9DLygZifxTuRvqLjGIeGhBg?=
 =?us-ascii?Q?nvSEhtOibigEoTcVHHcI3ySI=2F5PpSjSRjFmXEV1?=
 =?us-ascii?Q?0RhmX4Cm=2FppUqYewvWQ=2F5tk7jrmUlXmB7lN3zfh?=
 =?us-ascii?Q?YXS7CI8LTRa6bRWQaktilNY4BP=2F5qj1ZiN6J+EV?=
 =?us-ascii?Q?qy0Xj=2FrcXrx7trblrcNtLhkHyTyd4VjQCIzzCJZ?=
 =?us-ascii?Q?UyUTgn4TP782yHlFMKUiFF1KQj+WnfLEIsfbu2D?=
 =?us-ascii?Q?bfc=2F8cA5bRiKRhZJyP1rxNjLcQz=2FtFyiYawTjMj?=
 =?us-ascii?Q?lmQ=3D?=
X-SG-ID: =?us-ascii?Q?N2C25iY2uzGMFz6rgvQsb8raWjw0ZPf1VmjsCkspi=2FLxVM69ceEc1HIRn6NgiB?=
 =?us-ascii?Q?p73rdIU0DMJ3IWx1bL8zE89e=2FnH4jdWcju2=2FEfX?=
 =?us-ascii?Q?N0=2FDM+2ozrYw8mQUUU7iVlgjQT3QA5taTRQoXHw?=
 =?us-ascii?Q?1IQ=2F7jfps=2F+3OisQYt0SzVQ3gmqiPleOWuV93Tv?=
 =?us-ascii?Q?SF56Y3QbWfBNQPEjpY1LaDkkEyJtDvGIVj+83p0?=
 =?us-ascii?Q?=2FbgleaowA+cN1H6d6jcX1knZCym7a5uyq=2F7kxcB?=
 =?us-ascii?Q?gPRJuQpixc8+1jPmW2eyg=3D=3D?=
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
X-Entity-ID: 8Q8jjVs1FPKkJmddSUaV3Q==
X-Original-Sender: seed-conference-valencia@mail.beehiiv.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@mail.beehiiv.com header.s=s1 header.b=fxAJJ5GX;       spf=pass
 (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com
 designates 159.183.141.192 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
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

--dd12a6fe990891fefe193825d07c0093005878cfde324b6ca571a63a933a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/dcbc0422-e91e-4=
be2-9044-0744bbc94e07/6543f3704bcc1407f3339baf.png?t=3D1702884418)
Follow image link: (https://www.seedconference.eu/)
Caption:=20

# International Conference on Sustainable Energy Education

### July 3 - 5, 2024. Valencia, Spain

Visit seedconference.eu (https://www.seedconference.eu/)

View image: (https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,forma=
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/f07863db-3bc9-4=
31e-83c3-498d85cf41d1/hero-2024.jpg?t=3D1703196349)
Follow image link: (https://www.seedconference.eu/registration/)
Caption:=20

----------
**We wish you Happy holidays!!**


--------------------
# In this newsletter:


--------------------
Click on the section below to read more:


--------------------
**Call for Papers**
[Scope](#scope)
[Topics of interest](#topicsofinterest)
[Important dates](#importantdates)
[Publications and Awards](#publicationsaward)
[Submission guidelines](#submissionguidelines)



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
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/78a793ec-823a-4=
cfa-a827-6da26cf59def/Schermata_2023-12-21_alle_00.07.10.png?t=3D1703113645=
)
Caption:=20


----------## Publications

**All accepted extended abstracts will appear in the conference proceedings=
 book, which will be assigned a=C2=A0DOI=C2=A0and=C2=A0ISBN.** They will be=
 published in open access by=C2=A0UPV Press and submitted to be indexed in =
major international bibliographic databases. In previous conferences we org=
anized, proceedings were indexed in Scopus and the=C2=A0Thomson-Reuters Con=
ference Proceedings Citation Index =E2=80=93 Web of Science Core Collection=
=C2=A0(former ISI Proceedings).

## Award

To the=C2=A0Best Paper=C2=A0and=C2=A0Best Practice.

----------
## Submission guidelines


--------------------
Authors worldwide are invited to submit original and unpublished extended a=
bstracts not under review in any other conference or journal.=C2=A0
All extended abstracts will be peer-reviewed by the Program Committee based=
 on their significance, methodological soundness, originality, and clarity =
of exposition.


--------------------
See the template (https://www.seedconference.eu/wp-content/uploads/2023/12/=
sheet-seed-2024.docx)


--------------------
Submissions must be between 4 and 9 pages (A4 size), including 1 title page=
 + 8 pages with the main text, figures, tables, and references. Submissions=
 imply the willingness of at least one author to register, attend the confe=
rence, and present their contribution.


--------------------
Read more (https://www.seedconference.eu/submissions/)


--------------------
SEED is using the EasyChair platform to manage the submissions. The submiss=
ion website is **EASY CHAIR SEED 2024**


--------------------
Submit on Easy Chair Platform (https://easychair.org/conferences/?conf=3Dse=
ed2024)


--------------------
If you have not previously used the platform, you must register first.


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
https://seed-conference-valencia.beehiiv.com/p/newsletter-27-december-2023

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/hyxbG2epT4CDc5XYdEJ_2A%40geopod-ismtpd-5.

--dd12a6fe990891fefe193825d07c0093005878cfde324b6ca571a63a933a
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
meta name=3D"supported-color-schemes" content=3D"light"/><title>Registratio=
n is open - SEED &#39;24 Valencia</title><!--[if mso]><xml><o:OfficeDocumen=
tSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocum=
entSettings></xml><![endif]--><style>
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
upported-color-schemes" content=3D"light"/><title>Registration is open - SE=
ED &#39;24 Valencia</title><!--[if mso]><xml><o:OfficeDocumentSettings><o:A=
llowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></=
xml><![endif]--><style>
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
ht" valign=3D"top" style=3D"padding:20px 15px;"><p> December 27, 2023 &nbsp=
; | &nbsp; <a href=3D"https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_=
Ajv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-9C7Q4vE4f0CuzEXfxCeiYGiyAci8q=
D341MzbSrmr9jqa0RbLZ80afmuz_k2CPsmtiFgtTYLS3_CMWQlJVNZlVIu9rC92H6qweZCAh1Zy=
OqcDQhvi2hplol5V4He30jt0_jXcKQlYXUqJyAcmHDh3uRkrlkYwtqPbqNeaWFVeYfg0rKznUtw=
akl0fjd2q3l2viOAUvsJjNuebVqkLAahSq73xe60NfQMtvM6fjiUDkPj4055URDvpWFIeiZ-5Fa=
55ApLqW5B8xAR_dKhd8LXpk8HkBWFGmsl3xpFD3FR-ITfuRBZyfRHtLKYRJZvRbJMGguWltPbgw=
bGcdh2iSf-j9MJNtCkTGhyO9eKLvX0ZCYqjuCrfktyI6U2AD4iraAbZETJZRjFcshZefBlC2qzI=
mIABXkALVulME76suXKMLsllOXFxO1V4feOB9kloi-_eI-bnybeB04KNh8wtw6FptClaOyhS0C5=
-zBvsMuxM4dVgxxlyP9ubKj53yHJiPIkqNOAOHeAsZq3l0eRZ75JhaMlrSHJfAjKe7V_vHi3-EX=
dxgJWaO7GWZmWLNrbfIxZhzgkDdgvjwRxRnOchga2j-E3uobAiQ4-0aOwEwuREHbc/42h/Ha9tz=
qlrT_y1ujgoMl3Efw/h0/Uhg2161UcTBkp7bnxdNnr1-txPnwE77YtPhq2fIbaAI">Read Onli=
ne</a></p></td></tr><tr><td style=3D"height:0px;width:0px;"><div style=3D"h=
eight:1px;" data-open-tracking=3D"true"> <img src=3D"https://link.mail.beeh=
iiv.com/ss/o/hZ_JlIqIIa_woP0TRrumGA/42h/Ha9tzqlrT_y1ujgoMl3Efw/ho.gif" alt=
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
center" valign=3D"top" style=3D"width:252px;"><a href=3D"https://link.mail.=
beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPsR9R=
Ku4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9alof=
QGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3BQvzJR9qfXW-DPxUQzbsM7=
TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h1/d2i2o6gJ600BkOXkuxBSGonWTXF4AL75bz-1Dk=
pCAfU" rel=3D"noopener noreferrer nofollow" style=3D"text-decoration:none;"=
 target=3D"_blank"><img src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=
=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/f=
ile/dcbc0422-e91e-4be2-9044-0744bbc94e07/6543f3704bcc1407f3339baf.png?t=3D1=
702884418" alt=3D"" height=3D"auto" width=3D"252" style=3D"display:block;wi=
dth:100%;" border=3D"0"/></a></td></tr></table></td></tr><tr><td class=3D"d=
d" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:cen=
ter;"><h1><span style=3D"color:rgb(232, 25, 90);font-family:Arial;font-size=
:36px;">International Conference on Sustainable Energy Education</span></h1=
></td></tr><tr><td id=3D"july-3-5-2024-valencia-spain" class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
3><span style=3D"color:rgb(67, 138, 201);font-family:Arial;font-size:24px;"=
>July 3 - 5, 2024. Valencia, Spain</span></h3></td></tr><tr><td align=3D"ce=
nter" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding=
-right:15px;padding-top:14px;text-align:center;width:100%;word-break:break-=
word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cel=
lpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=
=3D"middle" height=3D"52" style=3D"height:52px;"><a href=3D"https://link.ma=
il.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9m5MmJ5O45XXPs=
R9RKu4epSYGkYa9qgU2Ndg7t04PyfTj1Vt18KDmIl-NsD22YBXfo4eMrOLnvxKY8J9vW8q8qo9a=
lofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY2a7NlqtUMgi5Qe-3BQvzJR9qfXW-DPxUQzb=
sM7TsF9Iw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h2/bdMK4ie4l5pXpoz_F7pgPF7b9kveTt8Av19=
oD1yHWvE" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"c=
olor:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;"> Visit =
seedconference.eu </a></td></tr></table></td></tr><tr><td align=3D"center" =
valign=3D"top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:=
0 auto 0 auto;"><tr><td align=3D"center" valign=3D"top" style=3D"width:630p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooV=
UgQpQHcjoAkkAh3L9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C=
1JVetpG8y-PdpbIgnAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8=
eQM_MyPpQ3PZeNs_l1TpgfJUSgxHlDQK1LQ4pEw/42h/Ha9tzqlrT_y1ujgoMl3Efw/h3/_EBRC=
484sEYrFcZICzWq8G6VhHI5cn2YatXGzERaLN4" rel=3D"noopener noreferrer nofollow=
" style=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https://med=
ia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredir=
ect,quality=3D80/uploads/asset/file/f07863db-3bc9-431e-83c3-498d85cf41d1/he=
ro-2024.jpg?t=3D1703196349" alt=3D"" height=3D"auto" width=3D"630" style=3D=
"display:block;width:100%;" border=3D"0"/></a></td></tr></table></td></tr><=
tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#fff5dc" style=3D"background=
-color:#fff5dc;padding:10px 0px 10px 0px;"><table role=3D"none" width=3D"10=
0%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" a=
lign=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:brea=
k-word;"><p><span style=3D"color:rgb(67, 138, 201);font-family:Arial;font-s=
ize:1.5rem;"><b>We wish you Happy holidays!!</b></span></p></td></tr></tabl=
e></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"paddi=
ng:0px 15px;text-align:center;"><h1><span style=3D"color:#e8195a;">In this =
newsletter:</span></h1></td></tr></table></td></tr></table></td></tr><tr><t=
d><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-colo=
r:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D=
"center" style=3D"padding:0px 15px;text-align:center;word-break:break-word;=
"><p><span style=3D"color:#e8195a;">Click on the section below to read more=
:</span></p></td></tr></table></td></tr></table></td></tr><tr><td><table ro=
le=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;p=
adding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"100%"><table role=3D"no=
ne" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td=
 width=3D"50%" style=3D"vertical-align:top;" class=3D"mob-stack"><table rol=
e=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">=
<tbody><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text=
-align:center;word-break:break-word;"><p><span style=3D"color:#e8195a;"><b>=
Call for Papers</b></span><br><span style=3D"color:#e8195a;"><a class=3D"li=
nk" href=3D"#scope" rel=3D"noopener noreferrer nofollow" clicktracking=3D"o=
ff">Scope</a></span><br><span style=3D"color:#e8195a;"><a class=3D"link" hr=
ef=3D"#topicsofinterest" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off">Topics of interest</a></span><br><span style=3D"color:#e8195a;"><a=
 class=3D"link" href=3D"#importantdates" rel=3D"noopener noreferrer nofollo=
w" clicktracking=3D"off">Important dates</a></span><br><span style=3D"color=
:#e8195a;"><a class=3D"link" href=3D"#publicationsaward" rel=3D"noopener no=
referrer nofollow" clicktracking=3D"off">Publications and Awards</a></span>=
<br><span style=3D"color:#e8195a;"><a class=3D"link" href=3D"#submissiongui=
delines" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">Submiss=
ion guidelines</a></span></p></td></tr></tbody></table></td><td width=3D"50=
%" style=3D"vertical-align:top;" class=3D"mob-stack"><table role=3D"none" w=
idth=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><=
td class=3D"dd" align=3D"center" style=3D"padding:0px 15px;text-align:cente=
r;word-break:break-word;"><p><span style=3D"color:#e8195a;"><b>Call for Wor=
kshops</b></span><br><span style=3D"color:#e8195a;"><a class=3D"link" href=
=3D"#reviewcriteria" rel=3D"noopener noreferrer nofollow" clicktracking=3D"=
off">Review criteria</a></span><br><span style=3D"color:#e8195a;"><a class=
=3D"link" href=3D"#proposalguidelines" rel=3D"noopener noreferrer nofollow"=
 clicktracking=3D"off">Proposals guidelines</a></span><br><span style=3D"co=
lor:#e8195a;"><a class=3D"link" href=3D"#importantdates-2" rel=3D"noopener =
noreferrer nofollow" clicktracking=3D"off">Important dates</a></span></p></=
td></tr></tbody></table></td></tr></table></td></tr></table></td></tr></tab=
le></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cells=
pacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" s=
tyle=3D"background-color:transparent;padding:0px 0px 0px 0px;"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15=
px;text-align:center;"><h1><span style=3D"color:#438ac9;">SEED 2024: Call f=
or Papers</span></h1></td></tr></table></td></tr></table></td></tr><tr><td =
id=3D"scope" class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:=
0px 15px;text-align:center;"><h2>Scope</h2></td></tr><tr><td class=3D"dd" a=
lign=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-wo=
rd;"><p> The<b> First International Conference on Sustainable Energy Educat=
ion (SEED)</b> aims to become a forum for researchers, academics, and pract=
itioners to exchange ideas, experiences, opinions, and research results rel=
ating to the preparation of students, teaching/learning methodologies, the =
organization of educational systems, partnerships and funding and governanc=
e related to Sustainable Energy Education. </p></td></tr><tr><td class=3D"d=
d" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:brea=
k-word;"><p> The <b>SEED</b> conference will be held on <b>July 3-5, 2024</=
b>, at the <b>Faculty of Business Administration and Management of the Univ=
ersitat Polit=C3=A8cnica de Val=C3=A8ncia (UPV)</b>, which has been ranked =
as the best technical university in Spain by the Academic Ranking of World =
Universities since 2014. </p></td></tr><tr><td><table id=3D"topicsofinteres=
t" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EF=
F2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
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
mWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU-3UNsujR0_ju2grTEiENyJE5OihvGbIwMq89l9FOdmT=
AaFsHnRbE7GCPfr9pvjw4_EWAxa4z8syUWNI/42h/Ha9tzqlrT_y1ujgoMl3Efw/h4/Y0m1WBct=
79Dwhes-2fW8xPG7Trmu4oJ5kNp5kqe2AcY" target=3D"_blank" rel=3D"noopener nore=
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
down,format=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/78a79=
3ec-823a-4cfa-a827-6da26cf59def/Schermata_2023-12-21_alle_00.07.10.png?t=3D=
1703113645" alt=3D"" height=3D"auto" width=3D"567" style=3D"display:block;w=
idth:100%;" border=3D"0"/></td></tr></table></td></tr></table></td></tr></t=
able></td></tr><tr><td id=3D"publicationsaward" class=3D"dd" align=3D"cente=
r" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2>Publica=
tions</h2></td></tr><tr><td class=3D"dd" align=3D"left" style=3D"padding:0p=
x 15px;text-align:left;word-break:break-word;"><p><b>All accepted extended =
abstracts will appear in the conference proceedings book, which will be ass=
igned a=C2=A0DOI=C2=A0and=C2=A0ISBN.</b> They will be published in open acc=
ess by=C2=A0UPV Press and submitted to be indexed in major international bi=
bliographic databases. In previous conferences we organized, proceedings we=
re indexed in Scopus and the=C2=A0Thomson-Reuters Conference Proceedings Ci=
tation Index =E2=80=93 Web of Science Core Collection=C2=A0(former ISI Proc=
eedings). </p></td></tr><tr><td class=3D"dd" align=3D"center" valign=3D"top=
" style=3D"padding:0px 15px;text-align:center;"><h2>Award</h2></td></tr><tr=
><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;=
word-break:break-word;"><p> To the=C2=A0Best Paper=C2=A0and=C2=A0Best Pract=
ice. </p></td></tr><tr><td><table id=3D"submissionguidelines" role=3D"none"=
 width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""=
><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px =
0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"to=
p" style=3D"padding:0px 15px;text-align:center;"><h2><span style=3D"">Submi=
ssion guidelines</span></h2></td></tr></table></td></tr></table></td></tr><=
tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background=
-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" ali=
gn=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word=
;"><p><span style=3D"">Authors worldwide are invited to submit original and=
 unpublished extended abstracts not under review in any other conference or=
 journal.=C2=A0</span><br><span style=3D"">All extended abstracts will be p=
eer-reviewed by the Program Committee based on their significance, methodol=
ogical soundness, originality, and clarity of exposition.</span></p></td></=
tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0p=
x 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-=
bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-alig=
n:center;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"non=
e" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><t=
d class=3D"v" align=3D"center" valign=3D"middle" height=3D"52" style=3D"hei=
ght:52px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh=
6W17ooVUgQpQHcjoAkkAh3L9kQlP9QpGOx82cyawC83eMelUai2WiV9CTT5coYb3lilWY9eU5I1=
x3zefT5HCTwZyGOdkLSOsOSboTqBGItstKpD2DC0pWdQZPwbLSM85I148wNn5htnpgMDfzxnC2g=
OHs_JbNRGznfG1NEfS_K8XN5Xj77Ud-QW0HcndzQcbIt6XNlg-J644kUZiGKSPGxIDgEFZWiE7x=
3Sm6otqbwKp2NQb3It6BaHRE-xNPBOG7_rQ/42h/Ha9tzqlrT_y1ujgoMl3Efw/h5/gSWOP3qib=
4IgTxtvKrLKkydOPbvrPRxevHkj4PL7y8g" target=3D"_blank" rel=3D"noopener noref=
errer nofollow" style=3D"color:#FFFFFF;font-size:18px;padding:0px 22px;text=
-decoration:none;"> See the template </a></td></tr></table></td></tr></tabl=
e></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-=
align:left;word-break:break-word;"><p><span style=3D"">Submissions must be =
between 4 and 9 pages (A4 size), including 1 title page + 8 pages with the =
main text, figures, tables, and references. Submissions imply the willingne=
ss of at least one author to register, attend the conference, and present t=
heir contribution.</span></p></td></tr></table></td></tr></table></td></tr>=
<tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"backgroun=
d-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100=
%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center=
" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-rig=
ht:15px;padding-top:14px;text-align:center;width:100%;word-break:break-word=
;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"=
middle" height=3D"52" style=3D"height:52px;"><a href=3D"https://link.mail.b=
eehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kRwuR9B71gtRmZkiE=
5Fb7FmfI9tMAhBptscSO1xOBx4y-tDRBQCzrpIL5Cxo7XQaDKGwnFYn_ofnW7CPeLYoUtKxTOpt=
nEJrObdN-4rO8hr8fyyWTpeOhfWoPjUs7pF1SMPhUt6aNZv3t7fD_Hlj_DWD8kYPU2p2ySiCq5a=
0rBRg/42h/Ha9tzqlrT_y1ujgoMl3Efw/h6/rI9jZFKdBT6J5f39qiGp9m5FCaT4kmDZPtpyf5u=
pWRE" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color=
:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;"> Read more =
</a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color=
:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"=
left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p>=
<span style=3D"">SEED is using the EasyChair platform to manage the submiss=
ions. The submission website is </span><span style=3D""><b>EASY CHAIR SEED =
2024</b></span></p></td></tr></table></td></tr></table></td></tr><tr><td><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#E=
FF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=
=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;=
padding-top:14px;text-align:center;width:100%;word-break:break-word;" class=
=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" =
height=3D"52" style=3D"height:52px;"><a href=3D"https://link.mail.beehiiv.c=
om/ss/c/mI7BQRoctVTIGHO43x85D0IyYHUvJ7fPUgDznev73L38PDgyfgzkQmM_MHGbRoyseYI=
C3OXxrejG_W2du5Evlp7IQT5bKjw35eZASG0VFoLYeuXeKuFnOQHdf48fth9QuRCLMi0p53qHr4=
-hjAQjhaOQe_fhCke2xMUDDU3msmn7P95v3YnXJr8H7DqCFNW0wmzOYiWfK1Q-qylAMpi1UlGmv=
6gG0YuxkEbTFRLLS8s/42h/Ha9tzqlrT_y1ujgoMl3Efw/h7/VfNtariB27D94sA3pSH0F9257r=
yEJLqmVF8eXMXlHLk" target=3D"_blank" rel=3D"noopener noreferrer nofollow" s=
tyle=3D"color:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;=
"> Submit on Easy Chair Platform </a></td></tr></table></td></tr></table></=
td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#=
EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align=
:left;word-break:break-word;"><p><span style=3D"">If you have not previousl=
y used the platform, you must register first.</span></p></td></tr></table><=
/td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"=
transparent" style=3D"background-color:transparent;padding:0px 0px 0px 0px;=
"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"p=
adding:0px 15px;text-align:center;"><h1><span style=3D"color:#438ac9;">SEED=
 2024: Call for Workshops</span></h1></td></tr></table></td></tr></table></=
td></tr><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-=
align:left;word-break:break-word;"><p><span style=3D"font-size:16px;">Resea=
rchers, academics, and practitioners are invited to submit proposals for wo=
rkshops at the=C2=A0</span><span style=3D"font-size:16px;"><b>SEED conferen=
ce</b></span><span style=3D"font-size:16px;">. The purpose of workshops is =
to give room for presenting ideas and discussing preliminary results in an =
interactive atmosphere while focusing on a specific topic. Workshops may be=
 proposed for=C2=A0</span><span style=3D"font-size:16px;"><b>a minimum of 1=
.5 hours and a maximum of 3 hours in length</b></span><span style=3D"font-s=
ize:16px;">. It should encourage lively debates and stimulate the productio=
n of new ideas and the discussion of controversial issues.</span></p></td><=
/tr><tr><td id=3D"reviewcriteria" class=3D"dd" align=3D"center" valign=3D"t=
op" style=3D"padding:0px 15px;text-align:center;"><h2>Review criteria</h2><=
/td></tr><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text=
-align:left;word-break:break-word;"><p><span style=3D"font-size:16px;">The =
decision on acceptance or rejection of a workshop proposal will be made</sp=
an><span style=3D"font-size:16px;"><b> based on the overall quality</b></sp=
an><span style=3D"font-size:16px;">=C2=A0of the proposal and its potential =
to attract a sufficiently broad community.=C2=A0</span></p></td></tr><tr><t=
d><table id=3D"proposalguidelines" role=3D"none" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7=
" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><=
tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15=
px;text-align:center;"><h2><span style=3D"">Proposal guidelines</span></h2>=
</td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" =
width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"">=
<tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0=
px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"left" style=3D"paddi=
ng:0px 15px;text-align:left;word-break:break-word;"><p><span style=3D""><b>=
All workshop proposals should be sent to=C2=A0</b></span><span style=3D""><=
b><a class=3D"link" href=3D"mailto:seedconf@upv.es" target=3D"_blank" rel=
=3D"noopener noreferrer nofollow" clicktracking=3D"off">seedconf@upv.es</a>=
</b></span><span style=3D"">=C2=A0</span><span style=3D""><b>in English</b>=
</span><span style=3D""> as a single PDF file (2-6 pages) containing the fo=
llowing sections:</span></p></td></tr><tr><td style=3D"padding-bottom:12px;=
padding-left:37px;padding-right:27px;padding-top:12px;" class=3D"ee"><div s=
tyle=3D"margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"list-style=
-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listItem u=
ltext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><spa=
n style=3D"font-size:12px;">Title and acronym.</span></p></li><li class=3D"=
listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-w=
ord;"><span style=3D"font-size:12px;">Abstract: 150-200 word abstract descr=
ibing the workshop purpose.</span></p><ul style=3D"list-style-type:disc;mar=
gin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listItem ultext"><p styl=
e=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"fon=
t-size:12px;">Objectives: a clear description of the workshop objectives.=
=C2=A0</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px=
;text-align:left;word-break:break-word;"><span style=3D"font-size:12px;">De=
scription of the topics and scope of the workshop.</span></p></li></ul></li=
><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word=
-break:break-word;"><span style=3D"font-size:12px;">Organizer: a short biog=
raphical sketch of the workshop organizer, describing relevant experience a=
nd qualifications.</span></p></li><li class=3D"listItem ultext"><p style=3D=
"padding:0px;text-align:left;word-break:break-word;"><span style=3D"font-si=
ze:12px;">Intended audience: description of the anticipated audience, inclu=
ding experience level and prerequisites, the expected number of participant=
s to the workshop and how the workshop organizer will call for participatio=
n.</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;tex=
t-align:left;word-break:break-word;"><span style=3D"font-size:12px;">Rough =
agenda: 1-page outline of the workshop content describing the workshop dyna=
mics, including tentative speakers, format (panels, call for extended abstr=
acts, etc).</span></p><ul style=3D"list-style-type:disc;margin:0px 0px;padd=
ing:0px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px=
;text-align:left;word-break:break-word;"><span style=3D"font-size:12px;">If=
 the workshops consist of the selection & publication of =E2=80=9Cextended =
abstracts=E2=80=9D (this is only a possibility):</span></p><ul style=3D"lis=
t-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"lis=
tItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word=
;"><span style=3D"font-size:12px;">Tentative dates</span></p></li><li class=
=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:bre=
ak-word;"><span style=3D"font-size:12px;">Review process=C2=A0</span></p></=
li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;wo=
rd-break:break-word;"><span style=3D"font-size:12px;">Publication opportuni=
ties=C2=A0</span></p></li></ul></li></ul></li><li class=3D"listItem ultext"=
><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span styl=
e=3D"font-size:12px;">Infrastructure: Description of the infrastructure nee=
ded to carry out the workshop.</span></p></li><li class=3D"listItem ultext"=
><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span styl=
e=3D"font-size:12px;">Statement from the organizers willing to publish an e=
xtended abstract of the findings of the workshop (Final version submission =
deadline July 28, 2024)</span></p></li><li class=3D"listItem ultext"><p sty=
le=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"fo=
nt-size:12px;">Maximum capacity of attendees=C2=A0</span></p></li><li class=
=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:bre=
ak-word;"><span style=3D"font-size:12px;">Other information: For instance, =
information that will let attendees know more about your workshop.</span></=
p></li></ul></div></td></tr></table></td></tr></table></td></tr><tr><td><ta=
ble role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EF=
F2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=
=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;=
padding-top:14px;text-align:center;width:100%;word-break:break-word;" class=
=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"middle" =
height=3D"52" style=3D"height:52px;"><a href=3D"https://link.mail.beehiiv.c=
om/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu_b5nHr6UwtK1UoRgJPAdwaj=
K7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwenjWNNfNBoPwLn738WYMqvKm=
_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMKn4xjJjWjdJTcBwlk6HYiP7pT=
XbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Efw/h8/BraEJ2jcwRzFdiKdAtFIOhFl_u=
DH9SoXgJdtg1vwWRM" target=3D"_blank" rel=3D"noopener noreferrer nofollow" s=
tyle=3D"color:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;=
"> Read more </a></td></tr></table></td></tr></table></td></tr></table></td=
></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"ba=
ckground-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D=
"100%"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0"><tr><td width=3D"50%" style=3D"vertical-align:top;" class=
=3D"mob-stack"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"dd" align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p><span style=
=3D""><b>Resources provided by the SEED organizing committee:</b></span></p=
></td></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-r=
ight:27px;padding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;" c=
lass=3D"edm_outlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px;p=
adding:0px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:=
0px;text-align:left;word-break:break-word;"><span style=3D"">A link on the =
SEED website.</span></p></li><li class=3D"listItem ultext"><p style=3D"padd=
ing:0px;text-align:left;word-break:break-word;"><span style=3D"">Management=
 of registration for participants.</span></p></li><li class=3D"listItem ult=
ext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span =
style=3D"">Setup of meeting space and related equipment.</span></p></li></u=
l></div></td></tr></tbody></table></td><td width=3D"50%" style=3D"vertical-=
align:top;" class=3D"mob-stack"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"dd" alig=
n=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;=
"><p><span style=3D""><b>The workshop organizer must take care of the follo=
wing:</b></span></p></td></tr><tr><td style=3D"padding-bottom:12px;padding-=
left:37px;padding-right:27px;padding-top:12px;" class=3D"ee"><div style=3D"=
margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"list-style-type:di=
sc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listItem ultext"><=
p style=3D"padding:0px;text-align:left;word-break:break-word;"><span style=
=3D"">Coordinating schedules and deadlines with the SEED organizing committ=
ee.</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;te=
xt-align:left;word-break:break-word;"><span style=3D"">Provide a brief desc=
ription of the workshop for inclusion in the SEED website and the workshop =
program when it is final.=C2=A0</span></p></li></ul></div></td></tr></tbody=
></table></td></tr></table></td></tr></table></td></tr></table></td></tr><t=
r><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-=
color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" =
valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padding-right=
:15px;padding-top:14px;text-align:center;width:100%;word-break:break-word;"=
 class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" valign=3D"mi=
ddle" height=3D"52" style=3D"height:52px;"><a href=3D"https://link.mail.bee=
hiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mu_b5nHr6UwtK1UoRgJ=
PAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd7LjMsdzpOMwenjWNNfNBoPwLn738W=
YMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws79zXOXhPaMKn4xjJjWjdJTcBwlk6H=
YiP7pTXbMlUNNbcnhBSM8KPM/42h/Ha9tzqlrT_y1ujgoMl3Efw/h9/eYXXDA9oDthiEk5ukIX9=
RJCHhQJ_5rg6oMx8k_Tu0no" target=3D"_blank" rel=3D"noopener noreferrer nofol=
low" style=3D"color:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration=
:none;"> Read more </a></td></tr></table></td></tr></table></td></tr></tabl=
e></td></tr><tr><td><table id=3D"importantdates-2" role=3D"none" width=3D"1=
00%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bg=
color=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px=
;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"=
padding:0px 15px;text-align:center;"><h2><span style=3D"color:#e8195a;">Imp=
ortant dates</span></h2></td></tr></table></td></tr></table></td></tr><tr><=
td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background-col=
or:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" val=
ign=3D"top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=3D"n=
one" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0 aut=
o 0 auto;"><tr><td align=3D"center" valign=3D"top" style=3D"width:567px;"><=
img src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=
=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/e0cd1559-3afa-41=
78-95fa-cf6bae4f034b/Schermata_2023-12-21_alle_00.06.14.png?t=3D1703113598"=
 alt=3D"" height=3D"auto" width=3D"567" style=3D"display:block;width:100%;"=
 border=3D"0"/></td></tr></table></td></tr></table></td></tr></table></td><=
/tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#2466A1" style=3D"backg=
round-color:#2466A1;padding:20px 0px 30px 0px;"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D=
"dd" align=3D"center" style=3D"padding:0px 15px;text-align:center;word-brea=
k:break-word;"><p><span style=3D"color:rgb(255, 255, 255);font-size:14px;">=
<b>Remember, your workshop proposal should be sent by e-mail=C2=A0</b></spa=
n><br><span style=3D"color:rgb(255, 255, 255);font-size:14px;"><b>by Februa=
ry 2, 2024 to =C2=A0</b></span><span style=3D"color:rgb(255, 255, 255);font=
-size:14px;"><b><a class=3D"link" href=3D"mailto:seedconf@upv.es" target=3D=
"_blank" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">seedcon=
f@upv.es</a></b></span><span style=3D"color:rgb(255, 255, 255);font-size:14=
px;"><b>.</b></span></p></td></tr></table></td></tr></table></td></tr><tr><=
td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;wo=
rd-break:break-word;"><p></p></td></tr></table></td></tr><tr><td class=3D"b=
" align=3D"center" valign=3D"top" bgcolor=3D"#438ac9" style=3D"padding:0px;=
border-bottom-left-radius:10px;border-bottom-right-radius:10px;"><table rol=
e=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" =
align=3D"center"><tr><td align=3D"center" valign=3D"top" bgcolor=3D"#fbbb16=
" style=3D"padding:12px"><table role=3D"none" width=3D"100%" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td><span style=3D"=
padding-left:1px;"></span></td><td align=3D"center" valign=3D"middle" width=
=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com/ss/c=
/9F_3DQ7aZvovpc0Duh6W19n_meO0wke5FKBzflRFc2B1AjZJ0VosL0wujpGzZ8xujKbjlJXUDP=
CB6z8vhEMnt0zgr_0xSB8mCA7I4_IzXxUL0BxvwowFr7KqKxUek2Yd4SXK0g0CgOE92Srqvc0Vo=
OTWsxhjeXzv6N0rcNwQKxEIDje94i_A07SYhbJ8C0ZF74_XYJ0jFb7h8TJGH6XgwQ/42h/Ha9tz=
qlrT_y1ujgoMl3Efw/h10/qZaD6gSE1PMs4sPBSfFDetqcOx9V1Ar6KGTz_JcSnKE" style=3D=
"text-decoration:none;"><img width=3D"22" alt=3D"fb" border=3D"0" style=3D"=
display:block;max-width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/ima=
ge/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/static_as=
sets/facebook_light.png"/></a></td><td align=3D"center" valign=3D"middle" w=
idth=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.beehiiv.com/=
ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2nMaTnkJ55jYEaSNckuOLy1HWqVTtOa7ci589JYeyvo=
DF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j7f7sIGH2rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb=
0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSpWd3zEBVTFR08EilFukyJ2VEnymcq5II-8xcGaFizA=
wad0SqXYw0sSyw1iKQ0z7uxVVj9Qumfs95Mo/42h/Ha9tzqlrT_y1ujgoMl3Efw/h11/DaD2mH3=
am6UPBCCYFzd6uvtt_EHC_eZA44ncLbGk65s" style=3D"text-decoration:none;"><img =
width=3D"22" alt=3D"tw" border=3D"0" style=3D"display:block;max-width:22px;=
" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3D=
auto,onerror=3Dredirect,quality=3D80/static_assets/x_light.png"/></a></td><=
td align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;"><a=
 href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W19-oP22J3Wo=
cJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9mwqiG-vvmwaV9DVnHpUEAKtXByiNzks-sZep-mXht=
zqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXfeRGZNcfrRDKc7G3t7Nqn0zn2al0tT8c5m5gwuznVQ=
3mwgGhRQyVlvNgi3cnUiSQSrGkQoCrNdg/42h/Ha9tzqlrT_y1ujgoMl3Efw/h12/psAEIDYbcO=
fc0lqjdx2eHe24_BHWhD5zPQmqunVZTpM" style=3D"text-decoration:none;"><img wid=
th=3D"22" alt=3D"ig" border=3D"0" style=3D"display:block;max-width:22px;" s=
rc=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Daut=
o,onerror=3Dredirect,quality=3D80/static_assets/instagram_light.png"/></a><=
/td><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px=
;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7=
KA6P29TklrPSmgGRK74cEOs7Myre-gzzHjUdIlLDmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGV=
ahbUKb5D0_XH4o1UZo-t6INhxP3gdAhU4tjDhIlBnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chg=
G_aj8iZKAiDdaEEgbfXmS6FC5vi4hd2XakUR_db9MoI6dg2EhOKV9wTakwI/42h/Ha9tzqlrT_y=
1ujgoMl3Efw/h13/eISlMMfB5aEejlSkFkFCtCyxSB9nJLu6DxMX2HCHbW4" style=3D"text-=
decoration:none;"><img width=3D"22" alt=3D"in" border=3D"0" style=3D"displa=
y:block;max-width:22px;" src=3D"https://media.beehiiv.com/cdn-cgi/image/fit=
=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/static_assets/l=
inkedin_light.png"/></a></td><td><span style=3D"padding-left:1px;"></span><=
/td></tr></table></td></tr><tr><td height=3D"10" style=3D"line-height:1px;f=
ont-size:1px;height:10px;"> &nbsp; </td></tr><tr><td class=3D"w" align=3D"c=
enter" valign=3D"top" style=3D"padding:15px;"><table role=3D"none" width=3D=
"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><t=
r><td align=3D"center" valign=3D"top"><p style=3D"font-family:'Arial',Helve=
tica,sans-serif;color:#FFFFFF!important;"> Update your email preferences or=
 unsubscribe <a class=3D"link" href=3D"https://link.mail.beehiiv.com/ss/c/Z=
wWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7F=
ihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW-E9LTlRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZ=
IGdZw-mQZmBJHQBjjdaAmfJVNSPeUtAlSEOBtutc9nCYFbIBUStCsKNv2sTEMoawWbx1iwH3iXq=
_r9j-Zglgv7qTGFbFHVKcQXvBs_GbVgIjeSooageTjl9yWcXxU3ZulcX5i5CiwKeIhs7Kt1NrT0=
s5Ae43KdM4wjMSjdHRHXVHY478-NpXAsbObjfpela-4ww24kpCC1ejo0FVn4IjIKXf8PToOwtpP=
7CfhcvSejKUfAb90W46AqQg4_PwoVxsv8PgnEzLb_EYupeWNDszU4KGquwCQogpnvzrsyyh4JGK=
JJraskA9V8ZRqZfPJOv7cbZeQ-SmYKhas29sD6lKLTHmtmQeZsNSK2-jjx5vt8h5GT6oW4wFnjy=
pUM-lS7U-CD8WaO-JZIwn1Z2JIC5jCTBm5OCoQWvL43NL7wZNWWYuyaRduZs-40DBxueYaGWaOa=
o-offum9afDfw-nCpbrpm4NKD0wVHvZFv4_pH-GVYAG2l3G_Z3iAg5K1YPtdDB0_qlVuzZM7MgP=
z3e2DtKyEpCA4twgHsMWGVsFlwf0mME95y4Y1qCfg7zxabDfZA/42h/Ha9tzqlrT_y1ujgoMl3E=
fw/h14/btQIAzGnFeDme0DVDCa2kf6yGxHpxBevklbSJfrNGFM" style=3D"text-decoratio=
n:underline;text-decoration-color:#FFFFFF!important;color:#FFFFFF!important=
;"> here</a></p><p class=3D"copyright" style=3D"font-family:'Arial',Helveti=
ca,sans-serif;color:#FFFFFF!important;"> &copy; 2023 SEED Conference 2024 -=
 Valencia </p><p style=3D"font-family:'Arial',Helvetica,sans-serif;color:#F=
FFFFF!important;"> Universitat Polit=C3=A8cnica de Val=C3=A8ncia Camino de =
Vera<br>Valencia, Comunidad Valenciana 46022 , Spain </p></td></tr><tr styl=
e=3D"display: table-row !important;"><td align=3D"center" valign=3D"top" st=
yle=3D"padding-top:20px;" style=3D"display:table-cell !important;"><table r=
ole=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"cent=
er" style=3D"display:table !important;"><tr style=3D"display:table-row !imp=
ortant;"><td class=3D"u" align=3D"center" valign=3D"middle" height=3D"32" s=
tyle=3D"height:32px;display:table-cell !important; max-height: 32px !import=
ant;margin:0px !important;"><a style=3D"line-height:32px !important;text-de=
coration:none;display:block !important;" href=3D"https://link.mail.beehiiv.=
com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1JVnHfTV-osXzaRbZV78wksJE9mGGPgwzX9IN3t4wez=
uL8pjHQ42uJK6JFvSArMCfZE29DNdTfJ9DZQCdXJGioNN2c8fkZGAINvwDFm_ZdFwmj_g7aDfhW=
4WkPqFlEFJIxU08p112LW7ho0niwgI1M_m8mlqbZpekZYebQSpig2JF_FyBB6jDL2ALlkz4Pw/4=
2h/Ha9tzqlrT_y1ujgoMl3Efw/h15/_Bq89SskEBq8UdGdX1ebLuv_jCxgaCO0O9UNrb2PD5E">=
<img src=3D"https://media.beehiiv.com/output-onlinepngtools.png" width=3D"1=
6" alt=3D"beehiiv logo" style=3D"display:inline-block !important;max-width:=
16px !important; vertical-align:-3px !important;width: 16px !important;" bo=
rder=3D"0"/><span style=3D"padding-left:11px !important;display: inline-blo=
ck !important;">Powered by beehiiv</span></a></td></tr></table></td></tr></=
table></td></tr></table></td></tr></table></td></tr></table></td></tr></tab=
le></td></tr></table></div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/hyxbG2epT4CDc5XYdEJ_2A%40geopod-ismtpd-5?utm_mediu=
m=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-=
dev/hyxbG2epT4CDc5XYdEJ_2A%40geopod-ismtpd-5</a>.<br />

--dd12a6fe990891fefe193825d07c0093005878cfde324b6ca571a63a933a--
