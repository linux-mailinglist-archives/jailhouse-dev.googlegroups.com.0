Return-Path: <jailhouse-dev+bncBAABBDH34GDAMGQEW4GTP6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC653B5375
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Jun 2021 15:30:52 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id m186-20020a1c26c30000b02901e1c85168f1sf1359695wmm.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Jun 2021 06:30:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624800652; cv=pass;
        d=google.com; s=arc-20160816;
        b=xZ6afJDoEOwvxRwllt1q7eivoAnGJQBR3BGaoA7aq6DfNRraxs6su58Odw08PY7Y/1
         473RpNyDE7AO+J6WcPmmN5lVe2MwAzLeaOBnwNl4eJHWJQbh08QlcUHURNmdlj4f6ecV
         Y91dwHHHLbie0fK61JRcovMRTn58EgrL51pvMiyFUcAVgBhRIFLwP3DjKAhKebfn8a9G
         iHbxfV6T8sobMuzMNnLscrJgSnSDU5D/DYX8hWrB5U+68tQwLpbzpUwloDd55fodOn1A
         dbIY17suJK2kwpSbCygNGXDFvnAYAX8jEVHxuzsnsiyCSK5ZVJSLuAo+gYhU+CTHWrua
         vTZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:date:feedback-id:list-unsubscribe-post
         :list-unsubscribe:content-transfer-encoding:mime-version:subject
         :message-id:to:from:sender:dkim-signature;
        bh=VODn7tWPd6CN+W5F3ssLNeWgquINFkOUD663zmAtFJM=;
        b=NMHuzd7BXUc0Ke+Ngb81oLOkcAqGCBQGJw68kaLM8uxuPYja4CWEjtaUuDepM7CHa7
         0iS5dD96kwwWLo39q5HhMfx4aphX2MzXkgQC6mqV1oqe4BOpcuFaYpnNx5Hv/qdIsm6I
         f7tbiPi7/6tqJmSTNenBsKQjJoPP5+oiHrT7GIHLwokbvW9FgEqgEhc7VlDQjswsTQlp
         JFJtyTBVizH3t2rqdRtZSLk3Q/JCa2PmLi7+iSFpur0l+keFRXxz399KiGyL4zHF6aE9
         tL6zgxTH/r7kO/TVSe0Wi9WSe3DP1vMGtT58UnfAjqQmVirDnnpXriljofEcVQbpHua8
         y99g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ics.events header.s=ipz header.b=jDGDqge6;
       dkim=pass header.i=@mrelayip.com header.s=ipzs1 header.b=Yf7Y4d7m;
       spf=pass (google.com: domain of conf@ics.events designates 82.199.156.135 as permitted sender) smtp.mailfrom=conf@ics.events;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:message-id:subject:mime-version
         :content-transfer-encoding:list-unsubscribe:list-unsubscribe-post
         :feedback-id:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=VODn7tWPd6CN+W5F3ssLNeWgquINFkOUD663zmAtFJM=;
        b=J/oNDccfvfFTbYcWqFx1WqcfK0t2zp2TDJqwgVBvsglTowut9uvc99Ah3Abrk/agT8
         i7TQa8EuXlXJQn0wc+kH/JLvdmJpb+SoLoVDZRIB3ddw4zH8Jc1qQv6EDiHJjw6Gcgk2
         f+Vype5QvR+ev62Z5K9mi2wvh1n1xPKpU3HO8yAadi9mDrZi2lY10r52In8A5yPxal4s
         7voAWKYTahvt4Nz0a0UX/CLx5akD3YEAoGekjXLLBXjZy/+yFU7vPOib9RkEDC/zIZZh
         smN4PwQkPkgmzhZ+AWLkwp0Eei1G4aFCREAYFvcKzDtshDj+YM4aMwNcqHKZ9mNgSlcB
         70EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:message-id:subject:mime-version
         :content-transfer-encoding:list-unsubscribe:list-unsubscribe-post
         :feedback-id:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=VODn7tWPd6CN+W5F3ssLNeWgquINFkOUD663zmAtFJM=;
        b=mmlh/Ssepruds+1FhLr9qdxTbIUpSSuGSbcWR2sn9icnZ0q4fAC5hI+wpJ4exAlxbJ
         dHcCL2rAr5YVJHW5WE05Mhfyk/E/i+7kyJK2Z+caDMNNYfw92CV1M5eUvBBfMGzVLckq
         1DuxFY2Tn1jzAYviNZssyrArF0wKBWTkCRIFquVMa7fZsLH6t2eiY215ni8olCsnBMsb
         r79JWZGNbtnLzAf7gyZCBh0Uh8HkaWrQR5aj7arw/DpUcM/iLgv6pi5bQ3oJmDFrddcF
         eRpku/NDFgbhXkeQh7ZvYsMyV1q6AWmgSGPICbzINkt2Z8NmiAx3Al9Xb88coGbwikMO
         yfnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315eRP7J1Rk3r1nsjT1xUkEqAZ1h9rzc0OdwodD/B4hNPlKj9Db
	a+kBJ/iduOVOpOc+hhQ4j0c=
X-Google-Smtp-Source: ABdhPJzyPSQiHc68R3ISqkP7dBrYXMk1MwJiUqw27ilDPzNhe2vb2pdyjQskA9XybFPI85y+ngL+8w==
X-Received: by 2002:a5d:5650:: with SMTP id j16mr21960722wrw.99.1624800652420;
        Sun, 27 Jun 2021 06:30:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:5106:: with SMTP id o6ls8400637wms.2.canary-gmail;
 Sun, 27 Jun 2021 06:30:51 -0700 (PDT)
X-Received: by 2002:a05:600c:2483:: with SMTP id 3mr20884260wms.117.1624800651634;
        Sun, 27 Jun 2021 06:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624800651; cv=none;
        d=google.com; s=arc-20160816;
        b=jTR1gdQ1roZvR23vwaFqWVQuhoQa7mUX/rjUaGNWmK9g2IErdN+sYgJdZYwKkq363p
         vObmeW0iMkshYWrpcJOxK2Ap0p2KXqmKSniaRy0xGadYqCCkhkRPXqa3jgPPEB8z/IQH
         09P9JkrnMl7szluIYjo5JyWlhTpRwP0Hjx8MOtI5Mekju6prnWYAQiQar46OzbZzT4ui
         YFX1gLzh+++hNHOSsdSL3uvOFvD4csHzvIpxnLNDsXzO15tbs4npzE8qb1T6+pk7uYqz
         5l3QzVBwFz5crYhbFA+td9+XMfFLcIfckHSWicO8a8Sb57DmCRGhxvHFzc41/ofq+N4K
         dsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:feedback-id:list-unsubscribe-post:list-unsubscribe
         :content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:dkim-signature;
        bh=rrEdK+esCVCT6Pktewu+a70j4Mnmrd6/+Uy8hClQnag=;
        b=xIV7MIrxQaBTCTC3tCMedEvfZ2MfCyROqyrWlXr5i1+s2pK/FSmSwD+NbmG1HfhunZ
         4rnIinRFfnlzcS7wvi56y99HkUskfAiGztF14wlSH9kNdEUU0FMvICgCveL8Y3R8gDrz
         OIDCwhwY02xNOUjVT+PKZjhFCrBxzKvxdf/I/aeyFax5LxOhJZBFDxOPyiS04D5CFMem
         wFMstKhdT4wbHUokM2UGmKchTTsc8LNMimqwETj9ww2skx7FZKEoehzwD3Le0DUqqwCv
         LqhanvpmY20g380AE9Ip3IFZjFbUw2Ry4h/evuxyl9FUBFxgQyUEGDMzIqB2tVpe+XwO
         l2Xg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ics.events header.s=ipz header.b=jDGDqge6;
       dkim=pass header.i=@mrelayip.com header.s=ipzs1 header.b=Yf7Y4d7m;
       spf=pass (google.com: domain of conf@ics.events designates 82.199.156.135 as permitted sender) smtp.mailfrom=conf@ics.events;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ics.events
Received: from core2-135-server.dyd.es (core2-135-server.dyd.es. [82.199.156.135])
        by gmr-mx.google.com with ESMTPS id k3si159674wrx.1.2021.06.27.06.30.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 06:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of conf@ics.events designates 82.199.156.135 as permitted sender) client-ip=82.199.156.135;
From: Tatiana Antipova <conf@ics.events>
To: jailhouse-dev@googlegroups.com
Message-ID: <1_OrDBXTBlWY@ics.ipzmarketing.com>
Subject: DSIC2021. Springer publication. Scopus, WoS Indexation. Deadline -
 August 11, 2021
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_60d87d8b5a740_169913fb394340cd82984e0";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SEID: 1_OrDBXTBlWY
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Report-Abuse: Please report abuse for this campaign here:
 https://ics.mx-router-ii.com/abuse_reports/new?id=xklvkl&token=-u3mwkrx
Feedback-ID: 149880:149880-49:campaign:IPZMR
Date: Sun, 27 Jun 2021 13:30:51 +0000
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ics.events header.s=ipz header.b=jDGDqge6;       dkim=pass
 header.i=@mrelayip.com header.s=ipzs1 header.b=Yf7Y4d7m;       spf=pass
 (google.com: domain of conf@ics.events designates 82.199.156.135 as permitted
 sender) smtp.mailfrom=conf@ics.events;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=ics.events
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>


----==_mimepart_60d87d8b5a740_169913fb394340cd82984e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MeCrown7Books27-06-21.jpg=20
( https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/llgmckvwsdq )

Dear Author,

You are cordially invited to submit your full paper of 6 - 12
pages!

The 2021 International Conference on Digital Science (DSIC 2021)
will be held in Luxembourg, Luxembourg, on October 15 =E2=80=93 17, 2021.
-----------------------------------------------------------------

-

Conference website is https://ics.events/dsic-2021/=20
( https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/b8-yqd69dvg ).
-----------------------------------------------------------------

Early submissions are greatly appreciated. A single attending
author may present a maximum of two papers onsite/online. The
presentation, award submission and proceedings submission for a
paper must all be in English.

You may submit your paper via DSIC 2021 Submission Form on
https://ics.events/dsic-2021/=20
( https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/dpqjfubwby0 ).
Submitted papers (until 12-page limit; including figures and
references) must comply with the requested format Template=20
( https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/zfeymvayom8 ), be
written in English, must not have been published before, not be
under review for any other conference or publication.

All submissions will be twice =C2=ABblind=C2=BB reviewed based on
relevance, timeliness, originality, importance and clarity of
expression with convincing argumentative. Besides globally
relevant meetings with internationally representative
program/scientific committees guaranteeing a strict
peer-reviewing and paper selection process. In case your paper=E2=80=99s
acceptance you will receive a notification letter. This letter
will contain your paper ID that you should include in all further
correspondences.

--------------------------
Publication and Indexation
--------------------------

Accepted, registered, and oral/virtual presented Papers will be
published in the 2021 International Conference on Digital Science
Proceeding by Springer in a book series "Lecture Notes in
Networks and Systems" (SJR 0,17; Q4 according to
https://www.scimagojr.com/journalrank.php=20
( https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/zh3wtw0zftu ),
2020) and then will be submitted to SCOPUS, Web of Science
(CPCI), Google Scholar and other indexations.

Submit your paper=20
( https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/zvxeqhnfd_e )

Due to the restrictions caused this year by COVID-19
Pandemic, corresponding authors with ICCS2021 registration will
have a discount of 50 USD in the DSIC 2021 registration.

En cumplimiento de lo dispuesto en la Protecci=C3=B3n de
Datos, para el ejercicio de sus derechos de acceso,
rectificaci=C3=B3n, cancelaci=C3=B3n y oposici=C3=B3n al tratamiento de sus
datos personales, contenidos en nuestras condiciones de
protecci=C3=B3n de datos, solamente tiene que responder a este e-mail
indicando su email en el asunto, o bien a trav=C3=A9s del env=C3=ADo de un
correo ordinario a la direcci=C3=B3n: INCLUIR DIRECCI=C3=93N. Si desea
darse de baja tambi=C3=A9n puede hacer clic aqu=C3=AD=20
( https://ics.mx-router-ii.com/unsubscribe/xklvkl/click?token=3D-u3mwkrx )
.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1_OrDBXTBlWY%40ics.ipzmarketing.com.

----==_mimepart_60d87d8b5a740_169913fb394340cd82984e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office">
      <head>
        <title>DSIC2021. Springer publication. Scopus, WoS Indexation. Dead=
line - August 11, 2021</title>
        <!--[if !mso]><!-- -->
        <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
        <!--<![endif]-->
        <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
        <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-sc=
ale=3D1">
        <style type=3D"text/css">
          #outlook a { padding:0; }
          .ReadMsgBody { width:100%; }
          .ExternalClass { width:100%; }
          .ExternalClass * { line-height:100%; }
          body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-=
size-adjust:100%; }
          table, td { border-collapse:collapse;mso-table-lspace:0pt;mso-tab=
le-rspace:0pt; }
          img { border:0;height:auto;line-height:100%; outline:none;text-de=
coration:none;-ms-interpolation-mode:bicubic; }
          p { display:block;margin:13px 0; }
        </style>
        <!--[if !mso]><!-->
        <style type=3D"text/css">
          @media only screen and (max-width:480px) {
            @-ms-viewport { width:320px; }
            @viewport { width:320px; }
          }
        </style>
        <!--<![endif]-->
        <!--[if mso]>
        <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
        </xml>
        <![endif]-->
        <!--[if lte mso 11]>
        <style type=3D"text/css">
          .outlook-group-fix { width:100% !important; }
        </style>
        <![endif]-->
       =20
      <!--[if !mso]><!-->
        <link href=3D"https://fonts.googleapis.com/css?family=3DUbuntu:300,=
400,500,700" rel=3D"stylesheet" type=3D"text/css">
        <style type=3D"text/css">
          @import url(https://fonts.googleapis.com/css?family=3DUbuntu:300,=
400,500,700);
        </style>
      <!--<![endif]-->

   =20
       =20
    <style type=3D"text/css">
      @media only screen and (min-width:480px) {
        .mj-column-per-100 { width:100% !important; max-width: 100%; }
      }
    </style>
   =20
 =20
        <style type=3D"text/css">
       =20
       =20

    @media only screen and (max-width:480px) {
      table.full-width-mobile { width: 100% !important; }
      td.full-width-mobile { width: auto !important; }
    }
 =20
        </style>
       =20
       =20
      </head>
      <body style=3D"background-color:#cfebff;">
       =20
       =20
      <div style=3D"background-color:#cfebff;">
       =20
     =20
      <!--[if mso | IE]>
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-section-outlook ed-section-header-outlook" style=3D"width:700px=
;" width=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-section ed-section-header" style=3D"background:#ffff=
ff;background-color:#ffffff;Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"background:#ffffff;background-color:#=
ffffff;width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:0px;padding-top:0px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-7-outlook" width=3D"700=
px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-7-outlook" style=3D"width:700px;" width=
=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-7" style=3D"Margin:0px auto;max-width=
:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"center" style=3D"font-size:0px;padding:0 10px;wo=
rd-break:break-word;">
               =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"border-collapse:collapse;border-spacing:0px;">
        <tbody>
          <tr>
            <td style=3D"width:680px;">
             =20
        <a href=3D"https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/llgmckvws=
dq" target=3D"_blank">
         =20
      <img alt=3D"MeCrown7Books27-06-21.jpg" height=3D"auto" src=3D"https:/=
/ics.mx-router-ii.com/data/a215ed8f2a4fd8bb23d59d3d23f4b3c92d9936ac/media_f=
iles/3/original/MeCrown7Books27-06-21.jpg" style=3D"border:0;display:block;=
outline:none;text-decoration:none;height:auto;width:100%;" width=3D"680">
   =20
        </a>
     =20
            </td>
          </tr>
        </tbody>
      </table>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-1-outlook" width=3D"700=
px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-1-outlook" style=3D"width:700px;" width=
=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-1" style=3D"background:#ffffff;backgr=
ound-color:#ffffff;Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"background:#ffffff;background-color:#=
ffffff;width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"center" class=3D"ed-text-container ed-column-num=
ber-0" style=3D"color: #c79e2e; font-family: Verdana, Geneva, sans-serif; t=
ext-align: center; font-size: 0px; padding: 0 10px; word-break: break-word;=
">
               =20
      <div style=3D"font-family:Verdana;font-size:16px;line-height:normal;t=
ext-align:center;color:#c79e2e;">
        <div>
<p style=3D"margin: 0 0 10px; text-indent: 35.45pt;"><span style=3D"color:#=
f1c40f"><strong><span style=3D"font-size:20px"><span style=3D'font-family:"=
Times New Roman",serif'>Dear Author, </span></span></strong></span></p>

<p style=3D"margin: 0 0 10px; text-indent: 0cm;"><span style=3D"color:#f1c4=
0f"><strong><span style=3D"font-size:20px"><span style=3D'font-family:"Time=
s New Roman",serif'><span lang=3D"EN-US">You are cordially invited to submi=
t your full paper of 6 - 12 pages</span></span>!</span></strong></span></p>
</div>
      </div>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-section-outlook ed-section-content-outlook" style=3D"width:700p=
x;" width=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-section ed-section-content" style=3D"background:#fff=
fff;background-color:#ffffff;Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"background:#ffffff;background-color:#=
ffffff;width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:0px;padding-top:0px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-2-outlook" width=3D"700=
px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-2-outlook" style=3D"width:700px;" width=
=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-2" style=3D"Margin:0px auto;max-width=
:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"left" class=3D"ed-text-container ed-column-numbe=
r-0" style=3D"color: #111111; font-family: 'Helvetica Neue', Helvetica, Ari=
al, sans-serif; font-size: 0px; padding: 0 10px; word-break: break-word;">
               =20
      <div style=3D"font-family:Helvetica;font-size:16px;line-height:normal=
;text-align:left;color:#111111;">
        <h4 style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-=
serif; font-size: 18px; text-align: justify;"><span style=3D"font-size:18px=
"><span style=3D'font-family:"Times New Roman",serif'><strong>The 2021 Inte=
rnational Conference on Digital Science</strong> (DSIC 2021) will be held i=
n <a name=3D"_Hlk67213822" target=3D"_blank" style=3D"color: #337ab7; text-=
decoration: underline;">Luxembourg</a>, Luxembourg, on <a name=3D"_Hlk67214=
091" target=3D"_blank" style=3D"color: #337ab7; text-decoration: underline;=
">October 15 =E2=80=93 17</a>, 2021. </span></span></h4>

<h4 style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; f=
ont-size: 18px; text-align: justify;">=C2=A0</h4>

<h4 style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; f=
ont-size: 18px; text-align: justify;"><span style=3D"font-size:18px"><span =
style=3D'font-family:"Times New Roman",serif'>Conference website is <a href=
=3D"https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/b8-yqd69dvg" style=3D"co=
lor: #0563c1; text-decoration: underline;" target=3D"_blank">https://ics.ev=
ents/dsic-2021/</a>.</span></span></h4>
      </div>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-5-outlook" width=3D"700=
px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-5-outlook" style=3D"width:700px;" width=
=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-5" style=3D"Margin:0px auto;max-width=
:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"left" class=3D"ed-text-container ed-column-numbe=
r-0" style=3D"color: #111111; font-family: 'Helvetica Neue', Helvetica, Ari=
al, sans-serif; font-size: 0px; padding: 0 10px; word-break: break-word;">
               =20
      <div style=3D"font-family:Helvetica;font-size:16px;line-height:1.1;te=
xt-align:left;color:#111111;">
        <div>
<p style=3D"margin: 0 0 10px; text-indent: 14.2pt; text-align: justify;"><s=
trong><span style=3D"font-size:16px"><span style=3D'font-family:"Times New =
Roman",serif'>Early submissions are greatly appreciated. A single attending=
 author may present a maximum of two papers onsite/online. The presentation=
, award submission and proceedings submission for a paper must all be in En=
glish. </span></span></strong></p>

<p style=3D"margin: 0 0 10px; text-indent: 14.2pt; text-align: justify;"><s=
trong><span style=3D"font-size:16px"><span style=3D'font-family:"Times New =
Roman",serif'>You may submit your paper via DSIC 2021 Submission Form on <a=
 href=3D"https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/dpqjfubwby0" style=
=3D"color: #0563c1; text-decoration: underline;" target=3D"_blank">https://=
ics.events/dsic-2021/</a>. Submitted papers (until 12-page limit<span style=
=3D"background-color:white"><span style=3D"color:#404040">; including figur=
es and references</span></span>) must comply<span style=3D"background-color=
:white"><span style=3D"color:#404040"> with the requested format=C2=A0</spa=
n></span><a href=3D"https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/zfeymvay=
om8" style=3D"color: #0563c1; text-decoration: underline;" target=3D"_blank=
"><span lang=3D"EN-US" style=3D"color:blue">Template</span></a>, be written=
 in English, must not have been published before, not be under review for a=
ny other conference or publication. </span></span></strong></p>

<p style=3D"margin: 0 0 10px; text-indent: 14.2pt; text-align: justify;"><s=
trong><span style=3D"font-size:16px"><span style=3D'font-family:"Times New =
Roman",serif'>All submissions will be twice =C2=ABblind=C2=BB reviewed base=
d on relevance, timeliness, originality, importance and clarity of expressi=
on with convincing argumentative. Besides globally relevant meetings with i=
nternationally representative program/scientific committees guaranteeing a =
strict peer-reviewing and paper selection process. In case your paper=E2=80=
=99s acceptance you will receive a notification letter. This letter will co=
ntain your paper ID that you should include in all further correspondences.=
</span></span></strong></p>
</div>
      </div>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-03af983a-8b6c-4fdf-8dde=
-c384f018a17b-outlook" width=3D"700px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-03af983a-8b6c-4fdf-8dde-c384f018a17b-out=
look" style=3D"width:700px;" width=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-03af983a-8b6c-4fdf-8dde-c384f018a17b"=
 style=3D"Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"left" class=3D"ed-text-container ed-column-numbe=
r-0" style=3D"color: #111111; font-family: 'Helvetica Neue', Helvetica, Ari=
al, sans-serif; font-size: 0px; padding: 0 10px; word-break: break-word;">
               =20
      <div style=3D"font-family:Helvetica;font-size:16px;line-height:normal=
;text-align:left;color:#111111;">
        <h2 style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-=
serif; font-size: 30px; text-indent: 0cm; text-align: center;"><span style=
=3D"font-size:20px"><strong><span style=3D"color:#e74c3c"><span style=3D'fo=
nt-family:"Times New Roman",serif'>Publication and Indexation</span></span>=
</strong></span></h2>

<p style=3D"margin: 0 0 10px; text-indent: 14.2pt; text-align: justify;"><s=
trong><span style=3D"font-size:16px"><span style=3D'font-family:"Times New =
Roman",serif'>Accepted, registered, and oral/virtual presented Papers will =
be published in the 2021 International Conference on Digital Science Procee=
ding <span style=3D"color:#e74c3c">by Springer in a book series "Lecture No=
tes in Networks and Systems"</span> (SJR 0,17; Q4 according to <a href=3D"h=
ttps://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/zh3wtw0zftu" target=3D"_blank=
" style=3D"color: #337ab7; text-decoration: underline;">https://www.scimago=
jr.com/journalrank.php</a>, 2020) and then will be submitted to <span style=
=3D"color:#e74c3c">SCOPUS, Web of Science (CPCI)</span>, Google Scholar and=
 other indexations.</span></span></strong></p>
      </div>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-d680dc28-1ad9-4725-86e8=
-f5f04fe84a66-outlook" width=3D"700px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-d680dc28-1ad9-4725-86e8-f5f04fe84a66-out=
look" style=3D"width:700px;" width=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-d680dc28-1ad9-4725-86e8-f5f04fe84a66"=
 style=3D"Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"center" vertical-align=3D"middle" style=3D"font-=
size:0px;padding:0 10px;word-break:break-word;">
               =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"border-collapse:separate;line-height:100%;">
        <tr>
          <td align=3D"center" bgcolor=3D"#c9c21d" role=3D"presentation" st=
yle=3D"border:6px solid #c9b81d;border-radius:9px;cursor:auto;padding:27px;=
text-align:center;background:#c9c21d;" valign=3D"middle">
            <a href=3D"https://ics.mx-router-ii.com/c/xklvkl/-u3mwkrx/zvxeq=
hnfd_e" style=3D"background:#c9c21d;color:#080101;font-family:Ubuntu, Helve=
tica, Arial, sans-serif;font-size:30px;font-weight:normal;line-height:120%;=
Margin:0;text-decoration:none;text-transform:none;" target=3D"_blank">
              Submit your paper
            </a>
          </td>
        </tr>
      </table>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-e6507c24-aa54-46fc-98f9=
-828b9404dfd6-outlook" width=3D"700px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-e6507c24-aa54-46fc-98f9-828b9404dfd6-out=
look" style=3D"width:700px;" width=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-e6507c24-aa54-46fc-98f9-828b9404dfd6"=
 style=3D"Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"left" class=3D"ed-text-container ed-column-numbe=
r-0" style=3D"color: #111111; font-family: 'Helvetica Neue', Helvetica, Ari=
al, sans-serif; font-size: 0px; padding: 0 10px; word-break: break-word;">
               =20
      <div style=3D"font-family:Helvetica;font-size:16px;line-height:normal=
;text-align:left;color:#111111;">
        <p style=3D"margin: 0 0 10px; text-align: justify;"><span style=3D"=
font-size:18px"><span style=3D'font-family:"Times New Roman",serif'>Due to =
the restrictions caused this year by COVID-19 Pandemic, <span style=3D"colo=
r:#e74c3c"><strong>corresponding authors with ICCS2021 registration</strong=
></span> will have a <span style=3D"color:#e74c3c"><strong>discount of 50 U=
SD</strong></span> in the DSIC 2021 registration.</span></span></p>
      </div>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
      <![endif]-->
   =20
   =20
      <table align=3D"center" class=3D"ed-section ed-section-footer" border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"b=
ackground:#333333;background-color:#333333;width:100%;">
        <tbody>
          <tr>
            <td>
             =20
       =20
      <!--[if mso | IE]>
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-section-outlook ed-section-footer-outlook" style=3D"width:700px=
;" width=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
       =20
      <div style=3D"Margin:0px auto;max-width:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:0px;padding-top:0px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
            <tr>
              <td
                 class=3D"ed-block-outlook ed-block-6-outlook" width=3D"700=
px"
              >
         =20
      <table
         align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
class=3D"ed-block-outlook ed-block-6-outlook" style=3D"width:700px;" width=
=3D"700"
      >
        <tr>
          <td style=3D"line-height:0px;font-size:0px;mso-line-height-rule:e=
xactly;">
      <![endif]-->
   =20
     =20
      <div class=3D"ed-block ed-block-6" style=3D"Margin:0px auto;max-width=
:700px;">
       =20
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"width:100%;">
          <tbody>
            <tr>
              <td style=3D"direction:ltr;font-size:0px;padding:20px 0;paddi=
ng-bottom:20px;padding-top:20px;text-align:center;vertical-align:top;">
                <!--[if mso | IE]>
                  <table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0">
               =20
        <tr>
     =20
            <td
               class=3D"" style=3D"vertical-align:top;width:700px;"
            >
          <![endif]-->
           =20
      <div class=3D"mj-column-per-100 outlook-group-fix" style=3D"font-size=
:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:top=
;width:100%;">
       =20
      <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"vertical-align:top;" width=3D"100%">
       =20
            <tr>
              <td align=3D"left" class=3D"ed-text-container ed-column-numbe=
r-0" style=3D"color: #ffffff; font-family: 'Helvetica Neue', Helvetica, Ari=
al, sans-serif; font-size: 0px; padding: 0 10px; word-break: break-word;">
               =20
      <div style=3D"font-family:Helvetica;font-size:15px;line-height:normal=
;text-align:left;color:#ffffff;">
        <div>En cumplimiento de lo dispuesto en la Protecci=C3=B3n de Datos=
, para el ejercicio de sus derechos de acceso, rectificaci=C3=B3n, cancelac=
i=C3=B3n y oposici=C3=B3n al tratamiento de sus datos personales, contenido=
s en nuestras condiciones de protecci=C3=B3n de datos, solamente tiene que =
responder a este e-mail indicando su email en el asunto, o bien a trav=C3=
=A9s del env=C3=ADo de un correo ordinario a la direcci=C3=B3n: INCLUIR DIR=
ECCI=C3=93N. Si desea darse de baja tambi=C3=A9n puede hacer clic=C2=A0<a h=
ref=3D"https://ics.mx-router-ii.com/unsubscribe/xklvkl/click?token=3D-u3mwk=
rx" target=3D"_blank" style=3D"color: #337ab7; text-decoration: underline;"=
>aqu=C3=AD</a>.</div>
      </div>
   =20
              </td>
            </tr>
         =20
      </table>
   =20
      </div>
   =20
          <!--[if mso | IE]>
            </td>
         =20
        </tr>
     =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
     =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
     =20
              </td>
            </tr>
         =20
                  </table>
                <![endif]-->
              </td>
            </tr>
          </tbody>
        </table>
       =20
      </div>
   =20
       =20
      <!--[if mso | IE]>
          </td>
        </tr>
      </table>
      <![endif]-->
   =20
     =20
            </td>
          </tr>
        </tbody>
      </table>
   =20
      </div>
   =20
      <img src=3D"https://ics.mx-router-ii.com/i/xklvkl/-u3mwkrx.gif" width=
=3D"1" height=3D"1" alt=3D"">
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
om/d/msgid/jailhouse-dev/1_OrDBXTBlWY%40ics.ipzmarketing.com?utm_medium=3De=
mail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-dev/1=
_OrDBXTBlWY%40ics.ipzmarketing.com</a>.<br />

----==_mimepart_60d87d8b5a740_169913fb394340cd82984e0--
