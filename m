Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB25XZLXAKGQEMCDQ2RI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3b.google.com (mail-yw1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 136D710066B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Nov 2019 14:26:05 +0100 (CET)
Received: by mail-yw1-xc3b.google.com with SMTP id o3sf9238103ywl.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Nov 2019 05:26:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574083563; cv=pass;
        d=google.com; s=arc-20160816;
        b=BxfLKqVIX4fz0pvSdQo3ruD5vqenS36MNHtzA2h+T1xFesW5mmZl2OsTYbPI3siEKn
         usk7hhrutM/GszI8cKovyeCu6STzTa05u6MIqPPOtcnNxCmjjo3De+zNmwK0CsVoip4x
         y63VXVtolISnwr75RC2KQ5+MhghcOyQ8MZFrex4z9iBOukwB6MOV59o3HjtN6oxsOVqj
         YmE02wqEgcbZ6E4tIZleQ8bSs+eLJotzztvM20IJcVbeTl/OvGyNiICGw1Sn6cAuTXnp
         s3y/7KnhdA/xhe5kRADzugTSQftdZSbB2ZvU9c7XpGj1MVJ+XI0hlOlY41hGeitFaDOs
         v4Kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=qgiZmu4+utPQ76SWfWNb94kuyS/1fJggvUez6GUaj64=;
        b=GsUbK2mMLNZxIZEhuparfDCpiG/fVHDF59mJ74rZPUUhEmR0upIg8Apz+qEVS9PhKR
         sW8tREb4e3A/oDWbI1WumXphywp2zy4NeLrjiuhg6lN9TGhm2ufsjzBdAIRKaSotKe4c
         j0ZYD0HlaiJl1Hyd5mR5jPR6R77kfblHHxh0IhKBib6z67K1Z1PhgeVnTwum3l73O152
         kuOvuY2iWdc87idybrSpiQkdU8sVcQDxAdzsX9P4/mfVu5R6ZY/aBpSfQAKV7kWO+Iin
         eozqy4wcnrmaM+eG0aTkEhh0Ovscai5TxLhhlYgFFe2QSYK0Vysdz6UAVw2cXoO0IKfn
         pbPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qDIhuKR+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=qgiZmu4+utPQ76SWfWNb94kuyS/1fJggvUez6GUaj64=;
        b=hz1eBKeh6CpPZvdUd5N/vnDUimLKmvo1R0WTNe/lFJbNI/5JLq6fxDZxn52t7fH1yi
         GC3Pe0s7xL1ZnYZjusgYaiTw4JtjQ+Ls0oKrV+8AIueqNjx6nCgzvXDxweg+vytIlAxP
         Nfq2Bgfq534L2cwJuxnGEsz0k9noQXkptSV2DT5Ut5yN1uomFn8/AIQ/qTOStOAu7Z/S
         YPnvRIiHznYSM3LfD4dyq54+KWcx0S0FSdescV/X40ftDE83aUif9K+YpNALaxA3cgGf
         eJcsOJ2DSwSJFi7yNs54qlZ+CkxD+2jRLVmDi0H+nFTdcidgPfH6iKzJwzUjd7PslpfJ
         HmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
         :message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qgiZmu4+utPQ76SWfWNb94kuyS/1fJggvUez6GUaj64=;
        b=cUc5/dXGVENGjfCPrOw7gPFN56nKfR7t43T5uVOoXItfg441rNKH/wzD7oQroCW8n2
         vnKk7CptbGnjgLpRlJsHsqH/E7XQPmRv73jTmji9KzurvRCzwWcwlpi7wgyr4DYE6Gq2
         0vdNu7qwapETzio0g1zu6+Xk0dHyNRWI4x6HdzZH5tj1o8z4/pjRQ4sMvgOmJPnIkIZ9
         EpVnQA/WPaX1dLBD50wLcFqLE+K5qGH+5Mi2RDBCfeaI3F0xtqjU5Cd+2ijm46oGfGFr
         ARavWgy7qEY3rlM7j3emiKN7cnIRajBDLuKx5H/S3SngL7NLpXThnpM9GIGFInR+2lLq
         WnEA==
X-Gm-Message-State: APjAAAWurNyVV8JKfihmu631wpnFbmeIKC6Q9QvlSfdFlHus/23kWKgR
	dutVhl6EijnjNodumHhCcc0=
X-Google-Smtp-Source: APXvYqyPkN1SwoBCO78C7Ygf1VUaCgCCICPiFDiq0e0R4w9a+tnyGSKJ9JWT/Xd1ZCwzeEz2gmzaAw==
X-Received: by 2002:a81:5885:: with SMTP id m127mr19812270ywb.484.1574083563695;
        Mon, 18 Nov 2019 05:26:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:5986:: with SMTP id n128ls2173679ywb.7.gmail; Mon, 18
 Nov 2019 05:26:03 -0800 (PST)
X-Received: by 2002:a81:3753:: with SMTP id e80mr20727032ywa.397.1574083563003;
        Mon, 18 Nov 2019 05:26:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574083562; cv=none;
        d=google.com; s=arc-20160816;
        b=Ng855yISl4VU/xDKUOaSJvE37qtIQ+2+w7cnaKhkis313l1Nh4TTBfly9xlCT7EAaE
         XqRbK2POV8zG6yzc0nOscGvzU/EsdIGgu628OmCGlquko/eigrjCMTc/cyJe0A8xOamA
         gV1iDrXxOESRuMeOShA0sgp/TW0qoMTfW6mfUO++1YIZWBByGNDn05LfoGlSML7+ScqB
         99hPJ5kdXn+0TU34YSitqqVfPPaP0H7TUWT87K7b5S6PQw629khsvzYA3Uy0DBqMrA8G
         8FuyUhJPs3+GLbaDPmS+Urww0RAqQUJnX23JcNUu++qYPPcBCCBPMgE89o1MWv080PJN
         g7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=uMSjqLTQ8j3MSYgVbmMmRHmZFCEfUkg/ObtRJT1lf0I=;
        b=khr4iJqBF0RkpRLE/f9gpdxXd8uhLLV14syy0qq6lNoh0nZKo3xpte5HDpe31k54p9
         7URsfAyOUgInZn0Gwk441aYLW8l3ZR0H6K7R5abEJ9LGI1h9jAZJMN4r920GwnrtjvHZ
         4/mXKMcZjujhCQ8t2dBin2dfTloGvIuiE4lBbX7yHRskIcop9g0Yw79Psl48UXBf2WXO
         jMoyNXJ9Df9AV3NO8ElzN8bQefVRx3CQstij/2J+FMLOcCc99BVjiJzp7ZFHt5nfEoNB
         X90JHsV4hqJMDCvVKkdiIiUZ5dZg4WSfq0oFbix961QMnPRvNFrYen8oW0TTQGfRHvlL
         KVnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qDIhuKR+;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id c79si861876ywb.3.2019.11.18.05.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 05:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAIDQ2Nt086740;
	Mon, 18 Nov 2019 07:26:02 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAIDQ2TF107055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Nov 2019 07:26:02 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 07:26:01 -0600
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
 DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
 15.01.1847.003; Mon, 18 Nov 2019 07:26:01 -0600
From: "'Devshatwar, Nikhil' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Jan
 Kiszka" <jan.kiszka@siemens.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Subject: ITS emulation in Jailhouse
Thread-Topic: ITS emulation in Jailhouse
Thread-Index: AdWeEfLzpin4bMtCThGlnPIJNbRGfg==
Date: Mon, 18 Nov 2019 13:26:01 +0000
Message-ID: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.132.238]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_ddc49d2b6a6f47a2b847b44aa1416074ticom_"
MIME-Version: 1.0
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=qDIhuKR+;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Reply-To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
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

--_000_ddc49d2b6a6f47a2b847b44aa1416074ticom_
Content-Type: text/plain; charset="UTF-8"

HI Jan,

Current Jailhouse implementation has support for partitioning the SPI interrupts on a GICv3.
However, the LPI interrupts managed by the GIC ITS cannot be partitioned.

Typical usage of LPI are for connecting PCIe devices on arm64 platforms where the endpoint sends MSI interrupts.
Kernel drivers for GIC assumes full ownership of the ITS module.

To enable partitioning of PCI devices/functions (from same or different PCI controller) across VMs,
One of the key important feature that will be needed is the ITS virtualization.


Since the GIC ITS does not support per VM tables, one option would be to use emulation of the ITS module.
Here is the proposal for such an approach.


*        GIC kernel driver allocates separate ITS table in its VM address space

*        When Jailhouse is enabled, Hypervisor allocates a new ITS table and copies the descriptors from root cell

*        All accesses to the ITS registers are trapped and emulated in the Jailhouse

*        Any attempt from a VM trying to setup the descriptor for a certain device needs to be policed against VM ownership

*        Jailhouse validates and updates the physical ITS table descriptors to match the VM maintained tables


This will be similar to the approach taken for SMMU stage1 emulation developed by Pratyush Yadav.

What so you think about adding this support in the Jailhouse?
Would you be willing to accept patches for the ITS emulation?

Regards,
Nikhil D

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ddc49d2b6a6f47a2b847b44aa1416074%40ti.com.

--_000_ddc49d2b6a6f47a2b847b44aa1416074ticom_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
tax=3D"http://schemas.microsoft.com/sharepoint/taxonomy/soap/" xmlns:tns=3D=
"http://schemas.microsoft.com/sharepoint/soap/recordsrepository/" xmlns:sps=
up=3D"http://microsoft.com/webservices/SharePointPortalServer/UserProfileSe=
rvice" xmlns:mml=3D"http://www.w3.org/1998/Math/MathML" xmlns:st=3D"&#1;" x=
mlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1083261766;
	mso-list-type:hybrid;
	mso-list-template-ids:-2122038696 688966208 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">HI Jan,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Current Jailhouse implementation has support for par=
titioning the SPI interrupts on a GICv3.<o:p></o:p></p>
<p class=3D"MsoNormal">However, the LPI interrupts managed by the GIC ITS c=
annot be partitioned.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Typical usage of LPI are for connecting PCIe devices=
 on arm64 platforms where the endpoint sends MSI interrupts.<o:p></o:p></p>
<p class=3D"MsoNormal">Kernel drivers for GIC assumes full ownership of the=
 ITS module.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">To enable partitioning of PCI devices/functions (fro=
m same or different PCI controller) across VMs,<o:p></o:p></p>
<p class=3D"MsoNormal">One of the key important feature that will be needed=
 is the ITS virtualization.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since the GIC ITS does not support per VM tables, on=
e option would be to use emulation of the ITS module.<o:p></o:p></p>
<p class=3D"MsoNormal">Here is the proposal for such an approach.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:Symbol"><span style=
=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roma=
n&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>GIC kernel driver allocates separate ITS tab=
le in its VM address space<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:Symbol"><span style=
=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roma=
n&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>When Jailhouse is enabled, Hypervisor alloca=
tes a new ITS table and copies the descriptors from root cell<o:p></o:p></p=
>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:Symbol"><span style=
=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roma=
n&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>All accesses to the ITS registers are trappe=
d and emulated in the Jailhouse<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:Symbol"><span style=
=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roma=
n&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>Any attempt from a VM trying to setup the de=
scriptor for a certain device needs to be policed against VM ownership<o:p>=
</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-family:Symbol"><span style=
=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &quot;Times New Roma=
n&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>Jailhouse validates and updates the physical=
 ITS table descriptors to match the VM maintained tables<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This will be similar to the approach taken for SMMU =
stage1 emulation developed by Pratyush Yadav.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What so you think about adding this support in the J=
ailhouse?<o:p></o:p></p>
<p class=3D"MsoNormal">Would you be willing to accept patches for the ITS e=
mulation?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Nikhil D<o:p></o:p></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ddc49d2b6a6f47a2b847b44aa1416074%40ti.com?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/ddc49d2b6a6f47a2b847b44aa1416074%40ti.com</a>.<br />

--_000_ddc49d2b6a6f47a2b847b44aa1416074ticom_--
