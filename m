Return-Path: <jailhouse-dev+bncBCDLVQP2RIKBBAHN6SWAMGQECJX5HJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103d.google.com (mail-pj1-x103d.google.com [IPv6:2607:f8b0:4864:20::103d])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD58285B3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 13:05:23 +0100 (CET)
Received: by mail-pj1-x103d.google.com with SMTP id 98e67ed59e1d1-28bd4766346sf1402570a91.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 04:05:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704801921; cv=pass;
        d=google.com; s=arc-20160816;
        b=1JpWkKeBfiKO2Zi3Wta1gohTZAHIadBPP4eBDSAiM/Db1ziKDKDRQ5Y3acIRwj6Gn+
         XhP4nnBEFWpcW5V8gaiZ3uZdfWCBSai6Xmm4B4u9C07E8y8WtQsoEBewEkJI/VHUXqNO
         xT8WgaxRRAodyXb4pY8wEay00rodnqi2BBD+Hgo61R+qOnKP77MGJZ9MGbGktzAILluR
         UKBaF65PmC/zjcHVTIOI2PXPnwALc5EWbQxl2bwIWzf8VGmJ1y6wi51DOhq4qRPTT2uo
         Ebeyajl5BPalzr/sNMi8PsnlOPgvR3dVNRcJUE/dvJscQByKVq+6Pr6zQIXo/lqt2JaF
         kHMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:list-unsubscribe:feedback-id:sid
         :reply-to:subject:message-id:mime-version:from:date:dkim-signature;
        bh=+1ZgvpIALdNPoVJ2flpHd8vbrP6lMc3jgJAmAk5uwjU=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=p0NSz1HDhmGeXkZlAnjsB6d1xy8sTpRnsHDOr1oKJNQs+wkTfVdftvd7GpcVoD0J0U
         S4Sg4P3X00PJLYpq/PBMjvWQkGuUpQeH9Wil0dNDe9R3mLFbUUUVaMyPn32zHatKCgT/
         0G+/e6yeWvCNuuvlur1+K//43X25k5qfhRUtOfHcBmp5ELGXVRffIJD79Wr8XbnrG9QL
         h4GHQ3DXqJftm85NX+SHJKTJFhK3Itwu9+fTFZSj9rPEwu6/RiY5pFYn4D+mkTG/zjdt
         OV2MMpBeHS6t0jq+T97nB9Fq8+m8Pa+a6GTV5P8d5f2OoUNQEpDz58x69Vgnqc7tEIP6
         gF2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=k2RmMqGT;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.192 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704801921; x=1705406721; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:list-unsubscribe:feedback-id:sid:reply-to
         :subject:message-id:mime-version:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1ZgvpIALdNPoVJ2flpHd8vbrP6lMc3jgJAmAk5uwjU=;
        b=Wf+mB1RfyOW1SSKeMTVO0czzz8F5SzpY1rFF1hI0n+NrlNWLyYwvmMtRYAVEoMcDeO
         uMIN7x3ypNK/ZEO7nuea/89G2ksLoiYfj+4/plBMT4t7QWCo6rnz1DKoNXoZNOM1+ekr
         QZmP7BLK3msjqiZyqXx0NfQm/D8ErsxBrblAN7HsKLAovPuDUaq0oFRdSFiPWadalZJX
         l2jJ6miWmye7/mDX8ZlsJgz0xj8YwGN46ZYal4GZm1v0/0ITSWZrsmJgZZP0wVgZWDHU
         dyMQxp1X18/7+VUcJr1V9ByjXxMS+7WSimvGAH8rwp6Wdac6oQWDvyCIUnjMmE+ms3XG
         ma4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704801921; x=1705406721;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to
         :list-unsubscribe:feedback-id:sid:reply-to:subject:message-id
         :mime-version:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1ZgvpIALdNPoVJ2flpHd8vbrP6lMc3jgJAmAk5uwjU=;
        b=k38UUgaa5dM3dEvO0/Ln9r0QM0GD6Am17roXP2z8lCSwQBn2hVkSH6pwZwe9iwW9i0
         dGoSZspZUIN5N8lBO3kkO0ag4JMKmfQwSGlktOm2SKU6dVH13hIrSNrUpA17FLUG0tHU
         UlKnYHdBOLZEXIRDi0ds8Qo1CMxgf5/CL8sLzok726yzfxfcqcHpSObeFDHNSIGnBzrx
         RLDtmseptwXoxx8uluWzLA1EIk0rx28UhQqt2q6SzuYhDoOro0dHyl5NF2wWooUP06V8
         rTIDxJ0+iDwSz3gZ4h1unvV3tBVqN/VLWulbQpgH3NZIClzCjFzAqqX/2xFt20cy7jke
         krKg==
X-Gm-Message-State: AOJu0Yys+nVo50OjTs9EuYdw3RbSx9GmLfpDpTisn3mA+p3Ehqji5R7L
	vlZ1m1sSFzfanV++yl0jxO4=
X-Google-Smtp-Source: AGHT+IHNyZ89+15v28RDlrUXYKZ478MKB/RLLvFAk9nchI9A0A3DwwQJm2yKmshJOCsXTQbtaq1Rgg==
X-Received: by 2002:a17:90b:3c3:b0:28b:bdc2:33b1 with SMTP id go3-20020a17090b03c300b0028bbdc233b1mr2277035pjb.34.1704801921335;
        Tue, 09 Jan 2024 04:05:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:3104:b0:28d:50dc:7fe9 with SMTP id
 gc4-20020a17090b310400b0028d50dc7fe9ls879905pjb.1.-pod-prod-04-us; Tue, 09
 Jan 2024 04:05:19 -0800 (PST)
X-Received: by 2002:a17:90a:a595:b0:28c:915c:5eca with SMTP id b21-20020a17090aa59500b0028c915c5ecamr2139501pjq.89.1704801919478;
        Tue, 09 Jan 2024 04:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704801919; cv=none;
        d=google.com; s=arc-20160816;
        b=inET91j4GYHagf5/xvag6pNUTRTbzOWqjfQSSeeNWBoUA2VfoHrsNi9pvXtZbjA7zP
         C/viVuZ1sLl6l0H5oD3xFssw8QmN9irGe9dd/bzj4bITt+Cj1uNzeSH5JEPszG0bodhk
         qa6XNwqRNyWYDaoKk1ZS/8b3h20FxwtGDf4ZJbkPNMuYA4zpWE0FhyRn8dr1N1uulAIY
         388N24PbIeTstarMWcWjdOQd+mpL8b+1/YjYLdnb6lGLSt6bdmQhPxXCYQ1qk7eR9X8T
         JASHtkn5mzpO+ubStBv6Iu2xXemD174DFOu3iNfxCXBIppcFnv277hraIisXVqfe0irV
         3Q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:list-unsubscribe:feedback-id:sid:reply-to:subject:message-id
         :mime-version:from:date:dkim-signature;
        bh=87D/0zGvCHDkTxuWN8ps/HemNpyrZEarAimEwIVHOug=;
        fh=gxv6KPRH6O+Oq3mqvhuXuTetS01385E93D+NhmqUcp4=;
        b=0KwxBud0Q7fiV9nQ5Viq/DkclgJkqE4i1bHP0G6+w5iP2hMFFuVQ8k1sVXdOKMebh2
         0c44qrYM44IgAaXnKxHOwS7I76X2xcFWg4Cdj72fJfYIIahKaN03NOUNVRbcVbY+q6NR
         NLCJ+Zlrq7beJ4gdnI9BVsf02BHX2Ul2sQpeSxJFx9+jgbCN0ivOieXGJh6VaQvVZ4eK
         vAaBmDrqgl0XHsuPxVEuahQFv2fp8GFz8tk6kE8Opnp2OLFEjW5+V4AlZR10arO+gIge
         OC+H1CcUVDptQ/YwKGcUKuBYhN05o81rpp/gDg+vZ+qI7NcUz6SAo4R4J7ar1lTelzbP
         Q5Tw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@mail.beehiiv.com header.s=s1 header.b=k2RmMqGT;
       spf=pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.192 as permitted sender) smtp.mailfrom="bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=beehiiv.com
Received: from o16.ptr6223.mail.beehiiv.com (o16.ptr6223.mail.beehiiv.com. [159.183.141.192])
        by gmr-mx.google.com with ESMTPS id lh11-20020a170903290b00b001d39c3be94bsi118356plb.8.2024.01.09.04.05.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 04:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+40343296-d1dd-jailhouse-dev=googlegroups.com@em2003.mail.beehiiv.com designates 159.183.141.192 as permitted sender) client-ip=159.183.141.192;
Received: by filterdrecv-5984d599dd-gzvxk with SMTP id filterdrecv-5984d599dd-gzvxk-1-659D3673-6E
        2024-01-09 12:05:07.564747599 +0000 UTC m=+7233791.099164732
Received: from NDAzNDMyOTY (unknown)
	by geopod-ismtpd-13 (SG) with HTTP
	id HnPfpTHvRTGZ5O1G_SIDZg
	Tue, 09 Jan 2024 12:05:07.473 +0000 (UTC)
Content-Type: multipart/alternative; boundary=4323bd09bc02649a01c0238bf3dff5fe5db5d46c59ef6d7234fafeb40f74
Date: Tue, 09 Jan 2024 12:05:18 +0000 (UTC)
From: "'SEED Conference' via Jailhouse" <jailhouse-dev@googlegroups.com>
Mime-Version: 1.0
Message-ID: <HnPfpTHvRTGZ5O1G_SIDZg@geopod-ismtpd-13>
Subject: Registration is open - SEED '24 Valencia
Reply-To: SEED Conference <seedconf@upv.es>
x-beehiiv-type: newsletter
x-newsletter-id: https://seed-conference-valencia.beehiiv.com/
x-newsletter-signup: https://seed-conference-valencia.beehiiv.com/subscribe
sId: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
x-newsletter: https://seed-conference-valencia.beehiiv.com/p/seed-conference-0901204
Feedback-ID: =?us-ascii?Q?4cc55ca3-913a-4bde-92c0-d644f2bbb6c0=3Anewsletter=3A71fc7e6d-cd28-?=
 =?us-ascii?Q?47c6-aa1e-5d673d88c28e=3A73c7af638dd0cac?=
x-list-id: 71fc7e6d-cd28-47c6-aa1e-5d673d88c28e
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
x-beehiiv-ids: =?us-ascii?Q?{=22account=5Fname=22=3A=22https=3A=2F=2Fseed-conference-valencia=2Ebeehiiv=2Ecom=2F?=
 =?us-ascii?Q?=22=2C=22campaign=5Fid=22=3A=224cc55ca3-913a-4bde-92c?=
 =?us-ascii?Q?0-d644f2bbb6c0=22=2C=22category=22=3A=22newsletter=22?=
 =?us-ascii?Q?=2C=22email=5Fgenerated=5Fat=22=3A1704801906=2C=22user=5F?=
 =?us-ascii?Q?id=22=3A=2271fc7e6d-cd28-47c6-aa1e-5d673d88c2?=
 =?us-ascii?Q?8e=22}?=
x-list-owner: <mailto:seedconf@upv.es>
X-SG-EID: =?us-ascii?Q?N+FhySnck2RAqxf=2F2q+C0uCc9fID1mnX8DhIspt9DLygZifxTuRvqLjGIeGhBg?=
 =?us-ascii?Q?nvSEhtOibigEoTcVHHcI3ySI=2F5PpSjSRjFmXEV1?=
 =?us-ascii?Q?0RhmX5rg8nyPu0jHlmihGAD3az2cgNzlb0RVCgc?=
 =?us-ascii?Q?SSsZBJnkaIQWQPY=2F9wKggYwl+DVWORzqfr4Uryo?=
 =?us-ascii?Q?32eV9BDgrlhfmED5hdy3gYqbatzbJLwUqEJFNAB?=
 =?us-ascii?Q?BgDyk9yDRuQn8uR2H7BRf+RzFl4r20A92vWSSWf?=
 =?us-ascii?Q?OG4=2Fo6ChacnLGJLijtcRwqajw+5E3XhTr0rVU8m?=
 =?us-ascii?Q?U=2FE=3D?=
X-SG-ID: =?us-ascii?Q?N2C25iY2uzGMFz6rgvQsb8raWjw0ZPf1VmjsCkspi=2FLxVM69ceEc1HIRn6NgiB?=
 =?us-ascii?Q?p7h0Pwaa55YDbiyHI7Am+1K4djEKFWUfJ9AVe8l?=
 =?us-ascii?Q?K7PiTJsUuskXRc2Q7LHNZ96V9FF40vmbTjDBlpm?=
 =?us-ascii?Q?rLJGcogMO3HPx9YObp5kVPoCIGdnUmvCuQsADI2?=
 =?us-ascii?Q?mhO8o2PPDHM8mOf+d=2FRdEAVECfijsT0lHE3GZsv?=
 =?us-ascii?Q?r3RCZoeRItbwItSG8MnBIKaDxDbp31LyWCXneic?=
 =?us-ascii?Q?on0dUVLdFRKhAlSnmlpsA=3D=3D?=
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
X-Entity-ID: 8Q8jjVs1FPKkJmddSUaV3Q==
X-Original-Sender: seed-conference-valencia@mail.beehiiv.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@mail.beehiiv.com header.s=s1 header.b=k2RmMqGT;       spf=pass
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

--4323bd09bc02649a01c0238bf3dff5fe5db5d46c59ef6d7234fafeb40f74
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
t=3Dauto,onerror=3Dredirect,quality=3D80/uploads/asset/file/0f5d962c-9f40-4=
340-99e7-eee934672118/hero-new3.jpg?t=3D1704789373)
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
https://seed-conference-valencia.beehiiv.com/p/seed-conference-0901204

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/HnPfpTHvRTGZ5O1G_SIDZg%40geopod-ismtpd-13.

--4323bd09bc02649a01c0238bf3dff5fe5db5d46c59ef6d7234fafeb40f74
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
ht" valign=3D"top" style=3D"padding:20px 15px;"><p> January 09, 2024 &nbsp;=
 | &nbsp; <a href=3D"https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_A=
jv99hyTBbuWNd24QqCn-b19AhOZMy-FPVkE1ycemZtXW-dgfz7LEB-Q9pyQHbb20KbLdZ2d-vkn=
HeMyQWnFqK64Alr6gCTgRQCTSL7QYhh0LxRDKuqtSJA_A4FS5xlKOkaEAcmmYNK4YJN2o2bbk0n=
XDf5DUgDGthLQjKAjfo3J5LcsNMFVB0jO4gA3TAHkOZOFt-k4WyvMxcm9QHqm7tCYowarbddgJn=
IfZVqMeNoDp0DQNJtFSc3oRpMYQV-G2i9BmAObgwaYG_AQdNPOB3UV11fkHetPQKJ_4IN9r6Fzc=
k5ngXRpLab-pvqnstP0dorD7nGDF9XsuCaXbNSqqkUi6YdHYcfX5kn2iax68eq_mL4pBl3TKIUe=
64OcjGjR4ROP20LoxQNpwtuKa6nSaLoWMM7Sozx7MpNBOEgJa15rAo7T_-_oNLEqDuz_FiucPQk=
WeB1irZk_fvxoObZ9wrgbSLxA1SukIC-DfR4SJHfxVhQQuUceWEPlAGcCEseIs81GbJeuy5A9wD=
FcqSzqYfBE7OwWv6Jwx_rNhD38fwCkWKp6BYQgnPZGdv-_ADAoOXP0Aesg8VPO-az1GkZKk36Gk=
uhXTsvBMObtTjhCs9sjihyHe2pyH4IpJUwUrps_15rdA6h8uaJwWdMpVT3AQC9q4/42u/ibow9b=
uJQAmGcG5wL9pMmw/h0/gZ0rMKOvvU5LiMtQ0DW4HKY4z7ZBkrtEXgE0TN_ia-A">Read Onlin=
e</a></p></td></tr><tr><td style=3D"height:0px;width:0px;"><div style=3D"he=
ight:1px;" data-open-tracking=3D"true"> <img src=3D"https://link.mail.beehi=
iv.com/ss/o/hZ_JlIqIIa_woP0TRrumGA/42u/ibow9buJQAmGcG5wL9pMmw/ho.gif" alt=
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
QGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw96fdy5rJdtf9I6P3cI8YuD=
uzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h1/NRFlJNhEvKVZISpUBYCIskquqFS25HjHhv78nk=
u7gy0" rel=3D"noopener noreferrer nofollow" style=3D"text-decoration:none;"=
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
lofQGTlZ6nL6_pzi1m2retIuYI2iqY4pqcTb3SIY0HxdYRQ0szHM8Mpw96fdy5rJdtf9I6P3cI8=
YuDuzwCLA/42u/ibow9buJQAmGcG5wL9pMmw/h2/VJn0zEL0pDNUz4AGTgbi4dd-aQGDR3RKJxM=
xmRwrJ-c" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"c=
olor:#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;"> Visit =
seedconference.eu </a></td></tr></table></td></tr><tr><td align=3D"center" =
valign=3D"top" style=3D"padding: 0px 15px 0px; " class=3D"dd"><table role=
=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:=
0 auto 0 auto;"><tr><td align=3D"center" valign=3D"top" style=3D"width:630p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooV=
UgQpQHcjoAkkAh3L9koN2XpmVENK4uKEKAKwZBSipGt4Rp3uhCJ84A0kbO5bLub9USqpFMOCs2C=
1JVetpG8y-PdpbIgnAb_cWMkk_iPCn5kXSkrKgTF3qNWmODWsfg3Pm3weyh7TgLMj1uTy_mSBi8=
eQM_MyPpQ3PZeNs_lm723ZZ2mBz35t25j6GVhQQ/42u/ibow9buJQAmGcG5wL9pMmw/h3/07pDi=
wQEKcfTIyNb6Svrdeeqq16ZoUNESVnt7Z98Kq8" rel=3D"noopener noreferrer nofollow=
" style=3D"text-decoration:none;" target=3D"_blank"><img src=3D"https://med=
ia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredir=
ect,quality=3D80/uploads/asset/file/0f5d962c-9f40-4340-99e7-eee934672118/he=
ro-new3.jpg?t=3D1704789373" alt=3D"" height=3D"auto" width=3D"630" style=3D=
"display:block;width:100%;" border=3D"0"/></a></td></tr></table></td></tr><=
tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" style=3D"background=
-color:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" ali=
gn=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;">=
<h1><span style=3D"color:#e8195a;">In this newsletter:</span></h1></td></tr=
></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"=
100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td b=
gcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0p=
x;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0"><tr><td class=3D"dd" align=3D"center" style=3D"padding:0px 15=
px;text-align:center;word-break:break-word;"><p><span style=3D"color:#e8195=
a;">Click on the section below to read more:</span></p></td></tr></table></=
td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#=
E8BEC7" style=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><table =
role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0"><tr><td width=3D"100%"><table role=3D"none" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"vertical=
-align:top;" class=3D"mob-stack"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"dd" alig=
n=3D"center" style=3D"padding:0px 15px;text-align:center;word-break:break-w=
ord;"><p><span style=3D"color:#e8195a;"><b>Call for Papers</b></span><br><s=
pan style=3D"color:#e8195a;"><a class=3D"link" href=3D"#scope" rel=3D"noope=
ner noreferrer nofollow" clicktracking=3D"off">Scope</a></span><br><span st=
yle=3D"color:#e8195a;"><a class=3D"link" href=3D"#topicsofinterest" rel=3D"=
noopener noreferrer nofollow" clicktracking=3D"off">Topics of interest</a><=
/span><br><span style=3D"color:#e8195a;"><a class=3D"link" href=3D"#importa=
ntdates" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">Importa=
nt dates</a></span><br><span style=3D"color:#e8195a;"><a class=3D"link" hre=
f=3D"#publicationsaward" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off">Publications and Awards</a></span><br><span style=3D"color:#e8195a=
;"><a class=3D"link" href=3D"#submissionguidelines" rel=3D"noopener norefer=
rer nofollow" clicktracking=3D"off">Submission guidelines</a></span></p></t=
d></tr></tbody></table></td><td width=3D"50%" style=3D"vertical-align:top;"=
 class=3D"mob-stack"><table role=3D"none" width=3D"100%" border=3D"0" cells=
pacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"dd" align=3D"center"=
 style=3D"padding:0px 15px;text-align:center;word-break:break-word;"><p><sp=
an style=3D"color:#e8195a;"><b>Call for Workshops</b></span><br><span style=
=3D"color:#e8195a;"><a class=3D"link" href=3D"#reviewcriteria" rel=3D"noope=
ner noreferrer nofollow" clicktracking=3D"off">Review criteria</a></span><b=
r><span style=3D"color:#e8195a;"><a class=3D"link" href=3D"#proposalguideli=
nes" rel=3D"noopener noreferrer nofollow" clicktracking=3D"off">Proposals g=
uidelines</a></span><br><span style=3D"color:#e8195a;"><a class=3D"link" hr=
ef=3D"#importantdates-2" rel=3D"noopener noreferrer nofollow" clicktracking=
=3D"off">Important dates</a></span></p></td></tr></tbody></table></td></tr>=
</table></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" s=
tyle=3D""><tr><td bgcolor=3D"transparent" style=3D"background-color:transpa=
rent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"ce=
nter" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h1><spa=
n style=3D"color:#438ac9;">SEED 2024: Call for Papers</span></h1></td></tr>=
</table></td></tr></table></td></tr><tr><td id=3D"scope" class=3D"dd" align=
=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h=
2>Scope</h2></td></tr><tr><td class=3D"dd" align=3D"left" style=3D"padding:=
0px 15px;text-align:left;word-break:break-word;"><p> The<b> First Internati=
onal Conference on Sustainable Energy Education (SEED)</b> aims to become a=
 forum for researchers, academics, and practitioners to exchange ideas, exp=
eriences, opinions, and research results relating to the preparation of stu=
dents, teaching/learning methodologies, the organization of educational sys=
tems, partnerships and funding and governance related to Sustainable Energy=
 Education. </p></td></tr><tr><td class=3D"dd" align=3D"left" style=3D"padd=
ing:0px 15px;text-align:left;word-break:break-word;"><p> The <b>SEED</b> co=
nference will be held on <b>July 3-5, 2024</b>, at the <b>Faculty of Busine=
ss Administration and Management of the Universitat Polit=C3=A8cnica de Val=
=C3=A8ncia (UPV)</b>, which has been ranked as the best technical universit=
y in Spain by the Academic Ranking of World Universities since 2014. </p></=
td></tr><tr><td><table id=3D"topicsofinterest" role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolo=
r=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><=
table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddi=
ng=3D"0"><tr><td class=3D"dd" align=3D"center" valign=3D"top" style=3D"padd=
ing:0px 15px;text-align:center;"><h2><span style=3D"">Topics of interest</s=
pan></h2></td></tr></table></td></tr></table></td></tr><tr><td><table role=
=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" s=
tyle=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;pad=
ding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"left" style=
=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p><span style=
=3D"">The Program Committee encourages the submission of extended abstracts=
 that communicate applied and empirical findings of interest to higher educ=
ation and vocational education & training professionals, researchers, and p=
ractitioners.</span><br><span style=3D"">Key topics include, but are not li=
mited to, the following subjects:</span></p></td></tr></table></td></tr></t=
able></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" sty=
le=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"non=
e" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td =
width=3D"100%"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"vertical-align:top;=
" class=3D"mob-stack"><table role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"dd" align=3D"left" =
style=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p><span =
style=3D""><b>Track 1: Teaching and Learning on Sustainable Energy Educatio=
n.</b></span><br><span style=3D""><i>Good practices related to:</i></span><=
/p></td></tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding=
-right:27px;padding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;"=
 class=3D"edm_outlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px=
;padding:0px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"paddin=
g:0px;text-align:left;word-break:break-word;"><span style=3D"">Renewable en=
ergy sources and their development, use, and impact</span></p></li><li clas=
s=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:br=
eak-word;"><span style=3D"">Development and use of electric vehicles and th=
e connection to the economy and the environment</span></p></li><li class=3D=
"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-=
word;"><span style=3D"">Efficient use of energy technologies for conservati=
on and reduction of waste</span></p></li><li class=3D"listItem ultext"><p s=
tyle=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"=
">Nature-Based Solutions (NBS)</span></p></li><li class=3D"listItem ultext"=
><p style=3D"padding:0px;text-align:left;word-break:break-word;"><span styl=
e=3D"">Circular Economy models</span></p></li></ul></div></td></tr></tbody>=
</table></td><td width=3D"50%" style=3D"vertical-align:top;" class=3D"mob-s=
tack"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0"><tbody><tr><td class=3D"dd" align=3D"left" style=3D"padding=
:0px 15px;text-align:left;word-break:break-word;"><p><span style=3D""><b>Tr=
ack 2: Partnerships, Collaboration on Sustainable Energy Education </b></sp=
an><br><span style=3D""><i>Good practices related to:</i></span></p></td></=
tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27p=
x;padding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;" class=3D"=
edm_outlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0=
px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px;text=
-align:left;word-break:break-word;"><span style=3D"">Traineeships & apprent=
iceships</span></p></li><li class=3D"listItem ultext"><p style=3D"padding:0=
px;text-align:left;word-break:break-word;"><span style=3D"">Energy career a=
nd workforce development in the energy industry</span></p></li><li class=3D=
"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-=
word;"><span style=3D"">Synthesis of energy information</span></p></li><li =
class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-brea=
k:break-word;"><span style=3D"">HUBS in sustainable energy</span></p></li><=
li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-b=
reak:break-word;"><span style=3D"">Skill needs of the labor market</span></=
p></li></ul></div></td></tr></tbody></table></td></tr></table></td></tr></t=
able></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcol=
or=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;">=
<table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadd=
ing=3D"0"><tr><td width=3D"100%"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td width=3D"50%" style=3D"v=
ertical-align:top;" class=3D"mob-stack"><table role=3D"none" width=3D"100%"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td class=3D"d=
d" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:brea=
k-word;"><p><span style=3D""><b>Track 3: Governance & Funding for Sustainab=
le Energy Education</b></span><br><span style=3D""><i>Good practices relate=
d to:</i></span></p></td></tr><tr><td style=3D"padding-bottom:12px;padding-=
left:37px;padding-right:27px;padding-top:12px;" class=3D"ee"><div style=3D"=
margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"list-style-type:di=
sc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"listItem ultext"><=
p style=3D"padding:0px;text-align:left;word-break:break-word;"><span style=
=3D"">Financing models</span></p></li><li class=3D"listItem ultext"><p styl=
e=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"">F=
inancial tools </span></p></li><li class=3D"listItem ultext"><p style=3D"pa=
dding:0px;text-align:left;word-break:break-word;"><span style=3D"">Financin=
g partnerships in energy</span></p></li><li class=3D"listItem ultext"><p st=
yle=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D""=
>Business models for energy education</span></p></li><li class=3D"listItem =
ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><sp=
an style=3D"">University spin-offs</span></p></li></ul></div></td></tr></tb=
ody></table></td><td width=3D"50%" style=3D"vertical-align:top;" class=3D"m=
ob-stack"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0"><tbody><tr><td class=3D"dd" align=3D"left" style=3D"pad=
ding:0px 15px;text-align:left;word-break:break-word;"><p><span style=3D""><=
b>Track 4: Sustainable Education </b></span><br><span style=3D""><i>Good pr=
actices related to:</i></span></p></td></tr><tr><td style=3D"padding-bottom=
:12px;padding-left:37px;padding-right:27px;padding-top:12px;" class=3D"ee">=
<div style=3D"margin-left:0px;" class=3D"edm_outlooklist"><ul style=3D"list=
-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"list=
Item ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;=
"><span style=3D"">Competency-based learning and skill assessment</span></p=
></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left=
;word-break:break-word;"><span style=3D"">Education accreditation, quality,=
 and assessment</span></p></li><li class=3D"listItem ultext"><p style=3D"pa=
dding:0px;text-align:left;word-break:break-word;"><span style=3D"">Innovati=
ve materials and new tools for teaching</span></p></li><li class=3D"listIte=
m ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;"><=
span style=3D"">Teaching and learning experiences</span></p></li><li class=
=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-break:bre=
ak-word;"><span style=3D"">Educational technology (e.g., virtual labs, e-le=
arning) </span></p></li></ul></div></td></tr></tbody></table></td></tr></ta=
ble></td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"no=
ne" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=
=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding=
:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=
=3D"padding-bottom:14px;padding-left:15px;padding-right:15px;padding-top:14=
px;text-align:center;width:100%;word-break:break-word;" class=3D"dd"><table=
 role=3D"none" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"ce=
nter"><tr><td class=3D"v" align=3D"center" valign=3D"middle" height=3D"52" =
style=3D"height:52px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ=
7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9mszuoN1yA3Jgho2bXfGfrQUhLLKabviJfrip-rY=
P96kA-VBSI8kiBGDdpfbj01i8em0e2HYj3ycF7PU6trmWjBhVAnpTTJZHHNA3NPQ-qBaTCE8AYU=
-3UNsujR0_ju2grTEiENyJE5OihvGbIwMq89UOJjUkOCQ1ExY2TEVowViic3_l3x6I2gon6YGT8=
9xZg/42u/ibow9buJQAmGcG5wL9pMmw/h4/55KW-Kotn-rCifk8pQ0xH1siF4Aims8KVAGQKO4K=
T4k" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:=
#FFFFFF;font-size:18px;padding:0px 22px;text-decoration:none;"> Read More <=
/a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td>=
<table id=3D"importantdates" role=3D"none" width=3D"100%" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#E8BEC7" styl=
e=3D"background-color:#E8BEC7;padding:0px 0px 0px 0px;"><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td c=
lass=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-=
align:center;"><h2><span style=3D"color:#e8195a;">Important dates</span></h=
2></td></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none=
" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"=
"><tr><td bgcolor=3D"#E8BEC7" style=3D"background-color:#E8BEC7;padding:0px=
 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"p=
adding: 0px 15px 0px; " class=3D"dd"><table role=3D"none" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0" style=3D"margin:0 auto 0 auto;"><tr><td ali=
gn=3D"center" valign=3D"top" style=3D"width:567px;"><img src=3D"https://med=
ia.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredir=
ect,quality=3D80/uploads/asset/file/78a793ec-823a-4cfa-a827-6da26cf59def/Sc=
hermata_2023-12-21_alle_00.07.10.png?t=3D1703113645" alt=3D"" height=3D"aut=
o" width=3D"567" style=3D"display:block;width:100%;" border=3D"0"/></td></t=
r></table></td></tr></table></td></tr></table></td></tr><tr><td id=3D"publi=
cationsaward" class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding=
:0px 15px;text-align:center;"><h2>Publications</h2></td></tr><tr><td class=
=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-break=
:break-word;"><p><b>All accepted extended abstracts will appear in the conf=
erence proceedings book, which will be assigned a=C2=A0DOI=C2=A0and=C2=A0IS=
BN.</b> They will be published in open access by=C2=A0UPV Press and submitt=
ed to be indexed in major international bibliographic databases. In previou=
s conferences we organized, proceedings were indexed in Scopus and the=C2=
=A0Thomson-Reuters Conference Proceedings Citation Index =E2=80=93 Web of S=
cience Core Collection=C2=A0(former ISI Proceedings). </p></td></tr><tr><td=
 class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;tex=
t-align:center;"><h2>Award</h2></td></tr><tr><td class=3D"dd" align=3D"left=
" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p> To =
the=C2=A0Best Paper=C2=A0and=C2=A0Best Practice. </p></td></tr><tr><td><tab=
le id=3D"submissionguidelines" role=3D"none" width=3D"100%" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" st=
yle=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"no=
ne" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td=
 class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;tex=
t-align:center;"><h2><span style=3D"">Submission guidelines</span></h2></td=
></tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" widt=
h=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr>=
<td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0=
px 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0"=
 cellpadding=3D"0"><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px=
 15px;text-align:left;word-break:break-word;"><p><span style=3D"">Authors w=
orldwide are invited to submit original and unpublished extended abstracts =
not under review in any other conference or journal.=C2=A0</span><br><span =
style=3D"">All extended abstracts will be peer-reviewed by the Program Comm=
ittee based on their significance, methodological soundness, originality, a=
nd clarity of exposition.</span></p></td></tr></table></td></tr></table></t=
d></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"ba=
ckground-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td align=3D=
"center" valign=3D"top" style=3D"padding-bottom:14px;padding-left:15px;padd=
ing-right:15px;padding-top:14px;text-align:center;width:100%;word-break:bre=
ak-word;" class=3D"dd"><table role=3D"none" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" align=3D"center" val=
ign=3D"middle" height=3D"52" style=3D"height:52px;"><a href=3D"https://link=
.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHcjoAkkAh3L9kQlP9QpGOx=
82cyawC83eMelUai2WiV9CTT5coYb3lilWY9eU5I1x3zefT5HCTwZyGOdkLSOsOSboTqBGItstK=
pD2DC0pWdQZPwbLSM85I148wNn5htnpgMDfzxnC2gOHs_JbNRGznfG1NEfS_K8XN5Xj77Ud-QW0=
HcndzQcbIt6XNlg-J644kUZiGKSPGxIDhFhX3yuNuuYljrYznKZy4Z8vbrnqcazA6CbHEsKYc1N=
A/42u/ibow9buJQAmGcG5wL9pMmw/h5/L1b7aHIt4DwxelCPKh_Pni6RiFcZrt3xQWjU6_9w1EU=
" target=3D"_blank" rel=3D"noopener noreferrer nofollow" style=3D"color:#FF=
FFFF;font-size:18px;padding:0px 22px;text-decoration:none;"> See the templa=
te </a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr>=
<td><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cell=
padding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-co=
lor:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=
=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"=
><p><span style=3D"">Submissions must be between 4 and 9 pages (A4 size), i=
ncluding 1 title page + 8 pages with the main text, figures, tables, and re=
ferences. Submissions imply the willingness of at least one author to regis=
ter, attend the conference, and present their contribution.</span></p></td>=
</tr></table></td></tr></table></td></tr><tr><td><table role=3D"none" width=
=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><=
td bgcolor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0p=
x 0px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-=
bottom:14px;padding-left:15px;padding-right:15px;padding-top:14px;text-alig=
n:center;width:100%;word-break:break-word;" class=3D"dd"><table role=3D"non=
e" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><t=
d class=3D"v" align=3D"center" valign=3D"middle" height=3D"52" style=3D"hei=
ght:52px;"><a href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh=
6W17ooVUgQpQHcjoAkkAh3L9kRwuR9B71gtRmZkiE5Fb7FmfI9tMAhBptscSO1xOBx4y-tDRBQC=
zrpIL5Cxo7XQaDKGwnFYn_ofnW7CPeLYoUtKxTOptnEJrObdN-4rO8hr8fyyWTpeOhfWoPjUs7p=
F1SMPhUt6aNZv3t7fD_Hlj_DIjOVkYrLzeuQ8LuyKQVn8A/42u/ibow9buJQAmGcG5wL9pMmw/h=
6/zltjZw8uGaaG-oIOYptMnAyM88IyTY5-Jg6yEmaaH_s" target=3D"_blank" rel=3D"noo=
pener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:18px;padding:0p=
x 22px;text-decoration:none;"> Read more </a></td></tr></table></td></tr></=
table></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100=
%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgco=
lor=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0"><tr><td class=3D"dd" align=3D"left" style=3D"padding:0px 15px;te=
xt-align:left;word-break:break-word;"><p><span style=3D"">SEED is using the=
 EasyChair platform to manage the submissions. The submission website is </=
span><span style=3D""><b>EASY CHAIR SEED 2024</b></span></p></td></tr></tab=
le></td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=
=3D"#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><t=
able role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14p=
x;padding-left:15px;padding-right:15px;padding-top:14px;text-align:center;w=
idth:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=
=3D"v" align=3D"center" valign=3D"middle" height=3D"52" style=3D"height:52p=
x;"><a href=3D"https://link.mail.beehiiv.com/ss/c/mI7BQRoctVTIGHO43x85D0IyY=
HUvJ7fPUgDznev73L38PDgyfgzkQmM_MHGbRoyseYIC3OXxrejG_W2du5Evlp7IQT5bKjw35eZA=
SG0VFoLYeuXeKuFnOQHdf48fth9QuRCLMi0p53qHr4-hjAQjhaOQe_fhCke2xMUDDU3msmn7P95=
v3YnXJr8H7DqCFNW0x2UVgjRgwUsxG6b1riWoXSsxh7RiW9njdYh_3cO0lCs/42u/ibow9buJQA=
mGcG5wL9pMmw/h7/OnV3Cf0AIxU4QPBNnBq7_LWKIaewYyTwY9rw0Q67x4w" target=3D"_bla=
nk" rel=3D"noopener noreferrer nofollow" style=3D"color:#FFFFFF;font-size:1=
8px;padding:0px 22px;text-decoration:none;"> Submit on Easy Chair Platform =
</a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td=
><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color=
:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"=
left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;"><p>=
<span style=3D"">If you have not previously used the platform, you must reg=
ister first.</span></p></td></tr></table></td></tr></table></td></tr><tr><t=
d><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0" style=3D""><tr><td bgcolor=3D"transparent" style=3D"background-=
color:transparent;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"1=
00%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" =
align=3D"center" valign=3D"top" style=3D"padding:0px 15px;text-align:center=
;"><h1><span style=3D"color:#438ac9;">SEED 2024: Call for Workshops</span><=
/h1></td></tr></table></td></tr></table></td></tr><tr><td class=3D"dd" alig=
n=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word;=
"><p><span style=3D"font-size:16px;">Researchers, academics, and practition=
ers are invited to submit proposals for workshops at the=C2=A0</span><span =
style=3D"font-size:16px;"><b>SEED conference</b></span><span style=3D"font-=
size:16px;">. The purpose of workshops is to give room for presenting ideas=
 and discussing preliminary results in an interactive atmosphere while focu=
sing on a specific topic. Workshops may be proposed for=C2=A0</span><span s=
tyle=3D"font-size:16px;"><b>a minimum of 1.5 hours and a maximum of 3 hours=
 in length</b></span><span style=3D"font-size:16px;">. It should encourage =
lively debates and stimulate the production of new ideas and the discussion=
 of controversial issues.</span></p></td></tr><tr><td id=3D"reviewcriteria"=
 class=3D"dd" align=3D"center" valign=3D"top" style=3D"padding:0px 15px;tex=
t-align:center;"><h2>Review criteria</h2></td></tr><tr><td class=3D"dd" ali=
gn=3D"left" style=3D"padding:0px 15px;text-align:left;word-break:break-word=
;"><p><span style=3D"font-size:16px;">The decision on acceptance or rejecti=
on of a workshop proposal will be made</span><span style=3D"font-size:16px;=
"><b> based on the overall quality</b></span><span style=3D"font-size:16px;=
">=C2=A0of the proposal and its potential to attract a sufficiently broad c=
ommunity.=C2=A0</span></p></td></tr><tr><td><table id=3D"proposalguidelines=
" role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" style=3D"background-color:#EF=
F2F7;padding:0px 0px 0px 0px;"><table role=3D"none" width=3D"100%" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td class=3D"dd" align=3D"ce=
nter" valign=3D"top" style=3D"padding:0px 15px;text-align:center;"><h2><spa=
n style=3D"">Proposal guidelines</span></h2></td></tr></table></td></tr></t=
able></td></tr><tr><td><table role=3D"none" width=3D"100%" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"#EFF2F7" sty=
le=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table role=3D"non=
e" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr><td =
class=3D"dd" align=3D"left" style=3D"padding:0px 15px;text-align:left;word-=
break:break-word;"><p><span style=3D""><b>All workshop proposals should be =
sent to=C2=A0</b></span><span style=3D""><b><a class=3D"link" href=3D"mailt=
o:seedconf@upv.es" target=3D"_blank" rel=3D"noopener noreferrer nofollow" c=
licktracking=3D"off">seedconf@upv.es</a></b></span><span style=3D"">=C2=A0<=
/span><span style=3D""><b>in English</b></span><span style=3D""> as a singl=
e PDF file (2-6 pages) containing the following sections:</span></p></td></=
tr><tr><td style=3D"padding-bottom:12px;padding-left:37px;padding-right:27p=
x;padding-top:12px;" class=3D"ee"><div style=3D"margin-left:0px;" class=3D"=
edm_outlooklist"><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0=
px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px;text=
-align:left;word-break:break-word;"><span style=3D"font-size:12px;">Title a=
nd acronym.</span></p></li><li class=3D"listItem ultext"><p style=3D"paddin=
g:0px;text-align:left;word-break:break-word;"><span style=3D"font-size:12px=
;">Abstract: 150-200 word abstract describing the workshop purpose.</span><=
/p><ul style=3D"list-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px=
;"><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;wo=
rd-break:break-word;"><span style=3D"font-size:12px;">Objectives: a clear d=
escription of the workshop objectives.=C2=A0</span></p></li><li class=3D"li=
stItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-wor=
d;"><span style=3D"font-size:12px;">Description of the topics and scope of =
the workshop.</span></p></li></ul></li><li class=3D"listItem ultext"><p sty=
le=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"fo=
nt-size:12px;">Organizer: a short biographical sketch of the workshop organ=
izer, describing relevant experience and qualifications.</span></p></li><li=
 class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;word-bre=
ak:break-word;"><span style=3D"font-size:12px;">Intended audience: descript=
ion of the anticipated audience, including experience level and prerequisit=
es, the expected number of participants to the workshop and how the worksho=
p organizer will call for participation.</span></p></li><li class=3D"listIt=
em ultext"><p style=3D"padding:0px;text-align:left;word-break:break-word;">=
<span style=3D"font-size:12px;">Rough agenda: 1-page outline of the worksho=
p content describing the workshop dynamics, including tentative speakers, f=
ormat (panels, call for extended abstracts, etc).</span></p><ul style=3D"li=
st-style-type:disc;margin:0px 0px;padding:0px 0px 0px 0px;"><li class=3D"li=
stItem ultext"><p style=3D"padding:0px;text-align:left;word-break:break-wor=
d;"><span style=3D"font-size:12px;">If the workshops consist of the selecti=
on & publication of =E2=80=9Cextended abstracts=E2=80=9D (this is only a po=
ssibility):</span></p><ul style=3D"list-style-type:disc;margin:0px 0px;padd=
ing:0px 0px 0px 0px;"><li class=3D"listItem ultext"><p style=3D"padding:0px=
;text-align:left;word-break:break-word;"><span style=3D"font-size:12px;">Te=
ntative dates</span></p></li><li class=3D"listItem ultext"><p style=3D"padd=
ing:0px;text-align:left;word-break:break-word;"><span style=3D"font-size:12=
px;">Review process=C2=A0</span></p></li><li class=3D"listItem ultext"><p s=
tyle=3D"padding:0px;text-align:left;word-break:break-word;"><span style=3D"=
font-size:12px;">Publication opportunities=C2=A0</span></p></li></ul></li><=
/ul></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:l=
eft;word-break:break-word;"><span style=3D"font-size:12px;">Infrastructure:=
 Description of the infrastructure needed to carry out the workshop.</span>=
</p></li><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:l=
eft;word-break:break-word;"><span style=3D"font-size:12px;">Statement from =
the organizers willing to publish an extended abstract of the findings of t=
he workshop (Final version submission deadline July 28, 2024)</span></p></l=
i><li class=3D"listItem ultext"><p style=3D"padding:0px;text-align:left;wor=
d-break:break-word;"><span style=3D"font-size:12px;">Maximum capacity of at=
tendees=C2=A0</span></p></li><li class=3D"listItem ultext"><p style=3D"padd=
ing:0px;text-align:left;word-break:break-word;"><span style=3D"font-size:12=
px;">Other information: For instance, information that will let attendees k=
now more about your workshop.</span></p></li></ul></div></td></tr></table><=
/td></tr></table></td></tr><tr><td><table role=3D"none" width=3D"100%" bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D""><tr><td bgcolor=3D"=
#EFF2F7" style=3D"background-color:#EFF2F7;padding:0px 0px 0px 0px;"><table=
 role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0"><tr><td align=3D"center" valign=3D"top" style=3D"padding-bottom:14px;pa=
dding-left:15px;padding-right:15px;padding-top:14px;text-align:center;width=
:100%;word-break:break-word;" class=3D"dd"><table role=3D"none" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" align=3D"center"><tr><td class=3D"v" =
align=3D"center" valign=3D"middle" height=3D"52" style=3D"height:52px;"><a =
href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W17ooVUgQpQHc=
joAkkAh3L9mu_b5nHr6UwtK1UoRgJPAdwajK7IMkyN31EXNCwsn_knxyOtnrfyKdrc51cmgsHyd=
7LjMsdzpOMwenjWNNfNBoPwLn738WYMqvKm_fW2MuDgeFo0zkPN-1fb7eLfgnK6xLG-X6bQK9ws=
79zXOXhPaMLi2dVHQPRWDgwgYYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQAmGcG5wL=
9pMmw/h8/ujE_vns4kD--ivO2skQAUTkyprVHX5VwFc82BQqWwkU" target=3D"_blank" rel=
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
6bQK9ws79zXOXhPaMLi2dVHQPRWDgwgYYYXwbG2VZpCjaQJmxdhEYTO4PHaY/42u/ibow9buJQA=
mGcG5wL9pMmw/h9/w85Yyg-ZYHLr0skwI3rSv85s8j15PJUeQWCZbz2OWF8" target=3D"_bla=
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
bJ8C0ZFIF9dinskejayF9qkVBe1yw/42u/ibow9buJQAmGcG5wL9pMmw/h10/Y7I64xGolG3fLV=
zrdBtmE4yHXZFBYZd9OBg7IndOLBU" style=3D"text-decoration:none;"><img width=
=3D"22" alt=3D"fb" border=3D"0" style=3D"display:block;max-width:22px;" src=
=3D"https://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,=
onerror=3Dredirect,quality=3D80/static_assets/facebook_light.png"/></a></td=
><td align=3D"center" valign=3D"middle" width=3D"75" style=3D"width:75px;">=
<a href=3D"https://link.mail.beehiiv.com/ss/c/PUGs6rgGaD04BJ7-U5njEzF7ylz2n=
MaTnkJ55jYEaSNckuOLy1HWqVTtOa7ci589JYeyvoDF3UUkfADhmXcEQIt7GsnrP-q47S7c_m5j=
7f7sIGH2rNjuyYfAVxa1PsoplgL1wuMjaH9bQkGkb0STxzJgv1rBJsK3GTYe6_7kov3y2eSnWSp=
Wd3zEBVTFR08EilFukyJ2VEnymcq5II-8xcGaFizAwad0SqXYw0sSyw1otlOjhtHH0BwXrfyhuO=
uT/42u/ibow9buJQAmGcG5wL9pMmw/h11/uJ3CvcUgm7C_BhFh4FglXAdT1zdoBnfgVeqFJbBvl=
U0" style=3D"text-decoration:none;"><img width=3D"22" alt=3D"tw" border=3D"=
0" style=3D"display:block;max-width:22px;" src=3D"https://media.beehiiv.com=
/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D=
80/static_assets/x_light.png"/></a></td><td align=3D"center" valign=3D"midd=
le" width=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.beehiiv=
.com/ss/c/9F_3DQ7aZvovpc0Duh6W19-oP22J3WocJyEIqlEBs30mdFwj7rvgg8GJtdPH65-M9=
mwqiG-vvmwaV9DVnHpUEAKtXByiNzks-sZep-mXhtzqiiDFVl6Yc-pzSZE0GtIWAKdXnvdmQaXf=
eRGZNcfrRDKc7G3t7Nqn0zn2al0tT8c5m5gwuznVQ3mwgGhRQyVl12AMLtNmy7K2GmITIAVvMQ/=
42u/ibow9buJQAmGcG5wL9pMmw/h12/fACMZps9rIC-pT5O2xwsChu8OOlCCy98bLtmnDSmTKI"=
 style=3D"text-decoration:none;"><img width=3D"22" alt=3D"ig" border=3D"0" =
style=3D"display:block;max-width:22px;" src=3D"https://media.beehiiv.com/cd=
n-cgi/image/fit=3Dscale-down,format=3Dauto,onerror=3Dredirect,quality=3D80/=
static_assets/instagram_light.png"/></a></td><td align=3D"center" valign=3D=
"middle" width=3D"75" style=3D"width:75px;"><a href=3D"https://link.mail.be=
ehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W16-6j7KA6P29TklrPSmgGRK74cEOs7Myre-gzzHj=
UdIlLDmhYyvXDVW6PLoay57VNP_TGaBrBfuggCTGVahbUKb5D0_XH4o1UZo-t6INhxP3gdAhU4t=
jDhIlBnadN3kC8Awlc198kkfb2pf-aE5mEC1d3chgG_aj8iZKAiDdaEEgsOwVa1zg_SE0Bn8HtK=
sKxIKceN_E4nFm3CoWu43hj4c/42u/ibow9buJQAmGcG5wL9pMmw/h13/MXrSLskRUYZvCMFoMC=
l3Jrg2Heu7KNQkjdyqED-EZNI" style=3D"text-decoration:none;"><img width=3D"22=
" alt=3D"in" border=3D"0" style=3D"display:block;max-width:22px;" src=3D"ht=
tps://media.beehiiv.com/cdn-cgi/image/fit=3Dscale-down,format=3Dauto,onerro=
r=3Dredirect,quality=3D80/static_assets/linkedin_light.png"/></a></td><td><=
span style=3D"padding-left:1px;"></span></td></tr></table></td></tr><tr><td=
 height=3D"10" style=3D"line-height:1px;font-size:1px;height:10px;"> &nbsp;=
 </td></tr><tr><td class=3D"w" align=3D"center" valign=3D"top" style=3D"pad=
ding:15px;"><table role=3D"none" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" align=3D"center"><tr><td align=3D"center" valign=3D"t=
op"><p style=3D"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!impo=
rtant;"> Update your email preferences or unsubscribe <a class=3D"link" hre=
f=3D"https://link.mail.beehiiv.com/ss/c/ZwWm8Yeov1Rezmf_f_Ajv99hyTBbuWNd24Q=
qCn-b19AhOZMy-FPVkE1ycemZtXW-Q53-MX7gHe7Fihm7L0SoRCvu1P1AjQJtLJVsB5CgUuKfaW=
-E9LTlRWORMLctKCw9DPd6QSE43Se_YtNfJxQkLyZIGdZw-mQZmBJHQBjjdaBfLnYqeodhnbcd4=
VV76uSihRdPCouOfCc_FthWzKIZ0rTHCd3dHlAlWxuv2Ovn8U9ikEb1843pZUyDX9qFYkhg-7Om=
YzWeBEoZO2T08Io6NCrr6jaUZ2irAM53qa6Nj3vVVz4xT7Fbmas44KhqqG10p-m5schHT5ba55U=
vfW-bJUX6rpypjFYp2Qi5abbnRa49WdGiib1EV7x8pl82y-YyZux1DvgBeVtDIwvssavHCQJ1eQ=
iCBlwwmYTtu3kDfXJeEU8MHKdeAoTxoW1tK3RjqJaPpzTQGmCJ4u_w1jSv25CgRX57jUk8mVNuC=
5fIgDETTun3MzXByT7x3dyYU04ppxpTwQMsELemxjF7w8QMwXU0oN-Kmf2EA2CMQiUilpUtRcQf=
w59SBqC_-CIIlRYbLR0h3aKTlCAEKWKfi3U2G3eYXWebPoximTUhmgHWKpR5-6wdrAVojVpZ3GT=
tXzS0thChANM_LiFwB2s5I_47oeDlWp2fRhEWyNxNJP3sVmW0YDzEhVH8YLfmXnmMQcj0S8I-Zn=
Vhp9Ja0xNb7I5C6w/42u/ibow9buJQAmGcG5wL9pMmw/h14/33SAIN5fiWmKrix4fPsGqnmGOQi=
nTAymCBWHPyw0Pbw" style=3D"text-decoration:underline;text-decoration-color:=
#FFFFFF!important;color:#FFFFFF!important;"> here</a></p><p class=3D"copyri=
ght" style=3D"font-family:'Arial',Helvetica,sans-serif;color:#FFFFFF!import=
ant;"> &copy; 2024 SEED Conference 2024 - Valencia </p><p style=3D"font-fam=
ily:'Arial',Helvetica,sans-serif;color:#FFFFFF!important;"> Universitat Pol=
it=C3=A8cnica de Val=C3=A8ncia Camino de Vera<br>Valencia, Comunidad Valenc=
iana 46022 , Spain </p></td></tr><tr style=3D"display: table-row !important=
;"><td align=3D"center" valign=3D"top" style=3D"padding-top:20px;" style=3D=
"display:table-cell !important;"><table role=3D"none" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" align=3D"center" style=3D"display:table !import=
ant;"><tr style=3D"display:table-row !important;"><td class=3D"u" align=3D"=
center" valign=3D"middle" height=3D"32" style=3D"height:32px;display:table-=
cell !important; max-height: 32px !important;margin:0px !important;"><a sty=
le=3D"line-height:32px !important;text-decoration:none;display:block !impor=
tant;" href=3D"https://link.mail.beehiiv.com/ss/c/9F_3DQ7aZvovpc0Duh6W13i1J=
VnHfTV-osXzaRbZV7_Rl1FzZwiJSW4hY_gEewf3rHZ8vMB9N1-EDL0J1hWTJlRr3ZPAcJEE1ZqF=
rnAbXEEpPPjAt6cG2zwjJfWuXKD5FBYaluY5OnLqrQEL2k5h3TIeMukXbdNoR9iQyQGDCzGSRAf=
AnwcdKQilI4J-0y3SnDLGNfRdlTxBxBl0r8iq5w/42u/ibow9buJQAmGcG5wL9pMmw/h15/l-GF=
9tbvH2q4QM6Kcn8fznzZSPcwyP3DM59HCQRso6Y"><img src=3D"https://media.beehiiv.=
com/output-onlinepngtools.png" width=3D"16" alt=3D"beehiiv logo" style=3D"d=
isplay:inline-block !important;max-width:16px !important; vertical-align:-3=
px !important;width: 16px !important;" border=3D"0"/><span style=3D"padding=
-left:11px !important;display: inline-block !important;">Powered by beehiiv=
</span></a></td></tr></table></td></tr></table></td></tr></table></td></tr>=
</table></td></tr></table></td></tr></table></td></tr></table></div></body>=
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/HnPfpTHvRTGZ5O1G_SIDZg%40geopod-ismtpd-13?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/HnPfpTHvRTGZ5O1G_SIDZg%40geopod-ismtpd-13</a>.<br />

--4323bd09bc02649a01c0238bf3dff5fe5db5d46c59ef6d7234fafeb40f74--
