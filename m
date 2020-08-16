Return-Path: <jailhouse-dev+bncBAABBMWS4P4QKGQEHSVHYBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-f55.google.com (mail-wr1-f55.google.com [209.85.221.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B12456A4
	for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Aug 2020 10:07:15 +0200 (CEST)
Received: by mail-wr1-f55.google.com with SMTP id 89sf5336478wrr.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Aug 2020 01:07:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597565235; cv=pass;
        d=google.com; s=arc-20160816;
        b=IXjFxmb1AcbH95aJAbNhUx4nAYaarrMOJVdYaLUXKxZh9DJRuIJBj63SNnk9L5UXCc
         sdCZ8Dw8pXVWqYNFlPMFnmH9zbK7iH8IXYUUWl+R0FdPlKKKcuMgdLtXQeEb9zK8K9bz
         k9IJG4T0lrVhQaeUm+oUEyo12SOo8luWeDUZi0ZgNxiS1NSs415OxF+SsGc4IQ2WHvV+
         VaZhqzeKYf+KTK1/a6LlNXOVYUYWM881ftT5+c4PMnlHEtUTvKV9zog9hdZaA6n6xloR
         7aanLSm2QUuCkZ5ZRq+4bJGEyuMso+OWG/WFYtMTR8eyam+w95iHQfrbd61qesfLN8rd
         MGBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:date:list-unsubscribe:mime-version:subject
         :message-id:to:sender:from;
        bh=4b154Z+8ltJ5efkalJf4nMl58KaL+X0FW6roh0za6eU=;
        b=KCv0c4vtrKI5uEoh2T10zDTntd56hQ46if+xv/0Pkv0k6OJhHCt3B/ABWKDukfV6tD
         4P8fqRtA4prDCs3vbudAwh7MdVPjPkHNqYXruvlR/Mc+gns4F2TqfdKmEZd2/7JbZL8M
         bRqRxxFe+4VF5pZz/PueXaj6UHIwAtE4YsDgcj4JNtLAGH4e3rVNdXetW93JnbroJTwg
         Qp9dthnpWpcakNyyQ2pwZ0OrxnMxtnZSTvzmvRX9Ac7e2n/z/9JRDPp9DiImwsoLJw7S
         vpyMuauI3SPq4ehnXcTaXonh79A8WjIZj9Tv/HdHuTOf76XEUMXQ3Z0lR5a0vlmek2D5
         JzyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@email.tb.ru header.s=dkim header.b=BkPXIwfc;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=nHv77IDm;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:sender:to:message-id:subject:mime-version
         :list-unsubscribe:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=4b154Z+8ltJ5efkalJf4nMl58KaL+X0FW6roh0za6eU=;
        b=p72FXFSIRMR773nc5aMv2EDAuf/fXts0IFXzq+VUuO+BWaiiRWzFW+O4NvJF0QwY71
         TSd5RZIGM4f4kSH4GGPhgBmnpl7p3NwCJ0bym4NWk4WF70jBFRTRwkxtgHN43BmQ1f/M
         tDLKRGY79hDBDpXd/Tp7w/AEQZEm0bxgNJnXEX6tGS1H6DjX+9fSfCQAeJPHR/omTOPT
         tMRZqrzJOER+nykhlVbGmZDM0pG0I8khwVHQy3xvb+BjFiM1u+iZLP7Re54qcqNma8Zn
         BS5fTYH83ONSXPvH/Ik6DbR+PWn04FN+ks+iw1kV7ABJ1lHaptN7z/4WjnRdlVjpN3vF
         Huww==
X-Gm-Message-State: AOAM5328VbGYpLBdv4i2p8ySluiudMNt3gHj0GcsNSDhK/O41rcGqnRV
	qZ10c8Knh7rEU62kr5/vMOw=
X-Google-Smtp-Source: ABdhPJwREKRQyEM+DGDUziBbXEDhWNgsj71h/gi4dOEhB2uJ6NliItuw0Nd0hR8g0mcE7Urb9S/OQg==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr9834887wrv.331.1597565235335;
        Sun, 16 Aug 2020 01:07:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls3220051wra.2.gmail; Sun, 16 Aug
 2020 01:07:14 -0700 (PDT)
X-Received: by 2002:adf:dc83:: with SMTP id r3mr10576507wrj.172.1597565234482;
        Sun, 16 Aug 2020 01:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597565234; cv=none;
        d=google.com; s=arc-20160816;
        b=joDAIfAD7Mw5TmYatFU1bqm1QZ3PPSOGEU9tmq9xXs5vU/5zaZpoOgksIJhFp63wuT
         cHY+kiN39BJUXa2QyYqsMHuhTICcXdya7oNtlSej2Ncg6HTEz8fVlxWk51yu+quo/54u
         I/IvNFVLlBRl1D4AOwLGOl0BU661SCVpEl4Hgg1p9xEScDnQvHqV7Ffz+aWKchZB+y07
         6Pn6EcZql8KachWffACaIx4+Koak1rr92OLUnsJMTA8ceMs+dHaNttlXNaU1QYuDRMl3
         R1D53wGw5cEmslB/vfJ9toSZ76bbbCsMQSQL/P0sIAYXyf98cVXVu7ctEbVWoh01xCYV
         Ba0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:list-unsubscribe:mime-version:subject:message-id:to:sender
         :from:dkim-signature:dkim-signature;
        bh=fdCRaUgfh3jhIrDVozrpxkWfkHf7V6MmXYolw8nd0jg=;
        b=Y6oEAk/3L5OrxV8mYCVMilv1UdWTUAPoxLizzb3z3pcIJ3HCnWDMl/TmfM2bAX6LHV
         fuZCClaSnpkoR3obO1SaVdgO9R0NVMjMPG7y2A+YMpa6GFDmdWYpL6N6ncA9OZW7rrSk
         7QSXuGArj6ukwY12U+XFxkDs35TTcwGyhSrC75tCB7mwpiY/WL8T/BnAQgc3bpXtWe8K
         1H/hbmr5b/ZaujaFa00pxzUwF7lcET0v/iPvGnKVhgapZ2ztq+oCv2kJm7xApytEcna3
         bp39ukrX7bniI//w0ELv9hg34M2x/AhmthTmSsbL6x6v4wqA9F1koRQm3VTxnGxd2ykC
         mV/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@email.tb.ru header.s=dkim header.b=BkPXIwfc;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=nHv77IDm;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru
Received: from smtp2.email.tb.ru (smtp2.email.tb.ru. [185.147.82.194])
        by gmr-mx.google.com with ESMTP id m3si648541wme.0.2020.08.16.01.07.14
        for <jailhouse-dev@googlegroups.com>;
        Sun, 16 Aug 2020 01:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) client-ip=185.147.82.194;
Received: by smtp1.email.tb.ru id h73kj42erpkc for <jailhouse-dev@googlegroups.com>; Sun, 16 Aug 2020 08:07:13 +0000 (envelope-from <postman3670461@email.tb.ru>)
From: "Tatiana Antipova" <conf@ics.events>
Sender: "Tatiana Antipova" <postman3670461@email.tb.ru>
To: jailhouse-dev@googlegroups.com
Message-Id: <E1k7DhB-Dsy4rA-ML@ucs102-ucs-7.msgpanel.com>
Subject: Springer Publication. Q3. Scopus, WoS Indexation. Deadline
 November, 01.
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MWs3RGhCLURzeTRyQS1NTA=="
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-Complaints-To: abuse@email.tb.ru
X-EnvId: uoproduction.tr_3670461:1k7Dh8-00054V-4kDC:1_amFpbGhvdXNlLWRldkBnb29nbGVncm91cHMuY29t
X-Feedback-ID: 3670461:transact:UO
X-ReplyTo: conf@ics.events
Date: Sun, 16 Aug 2020 08:07:13 +0000
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@email.tb.ru header.s=dkim header.b=BkPXIwfc;       dkim=pass
 header.i=@topeml.com header.s=jul2015 header.b=nHv77IDm;       spf=pass
 (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194
 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--MWs3RGhCLURzeTRyQS1NTA==
Content-Type: multipart/alternative; 
	boundary="----=_Part_245391_1303982550.1597565233482"

------=_Part_245391_1303982550.1597565233482
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Author,

You are cordially invited to the 2021 International Conference on Advances =
in Digital Science (ICADS 2021), to be held at Salvador, Brazil, 19 =E2=80=
=93 21 February 2021.
ICADS 2021 is an international forum for researchers and practitioners to p=
resent and discuss the most recent innovations, trends, results, experience=
s and concerns in the several advances of Digital Science.
Conference website https://ics.events/icads-2021/ (https://ics.events/icads=
-2021/).
You may submit your paper online via Conference Submission Form on https://=
ics.events/icads-2021/. (https://ics.events/icads-2021/) Submitted papers (=
until 10-12 page limit) must be written in English, must not have been publ=
ished before, not be under review for any other conference or publication, =
must comply with Template in .doc/docx format.
All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.

Accepted and registered Papers will be published in ICADS 2021 Proceeding b=
y Springer in a book of the =E2=80=9CAdvances in Intelligent Systems and Co=
mputing=E2=80=9D (included in Scopus source list, Q3 / JSR 0,184), and then=
 will be submitted to ISI Proceedings, SCOPUS, Google Scholar and other ind=
exations.
We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.
Due to the restrictions caused this year by COVID-19 Pandemic, authors with=
 registration in ICCS2020 will have a discount of 50 USD in the ICADS 2021 =
registration.

Important Dates

01

Submission: November 01, 2020

02

Notification: December 11, 2020

03

Registration: December 21, 2020

ICADS CONVENER (https://ics.events/)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E1k7DhB-Dsy4rA-ML%40ucs102-ucs-7.msgpanel.com.

------=_Part_245391_1303982550.1597565233482
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www=
.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
    <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
    <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=
=3D1, maximum-scale=3D1, user-scalable=3D0">
    <meta name=3D"format-detection" content=3D"telephone=3Dno">
    <title></title>
    <!--[if (gte mso 9)|(IE)]>
    <style type=3D"text/css">
        table {border-collapse: collapse;}
    </style>
    <![endif]-->

</head>

<body style=3D"min-width: 100%; padding: 0; background-color: #eeefef; marg=
in: 0;">
    <center class=3D"sb-wrapper" style=3D"width: 100%; table-layout: fixed;=
 -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;">
        <div class=3D"sb-webkit" style=3D"max-width: 560px; border-radius: =
4px; overflow: hidden;">
            <!--[if (gte mso 9)|(IE)]>
                <table width=3D"560" align=3D"center" cellpadding=3D"0" cel=
lspacing=3D"0" border=3D"0" style=3D"border-spacing: 0; font-family: sans-s=
erif; color: #333;">
                    <tr>
                        <td style=3D"padding: 0;">
            <![endif]-->
                <table class=3D"sb-block s-text sb-text-dark" style=3D"bord=
er-spacing: 0; font-family: sans-serif; position: relative; width: 100%; ma=
x-width: 560px; background-position: 50% 50%; margin: 0 auto; word-break: b=
reak-word; color: #111; background-color: #fff;" cellspacing=3D"0" width=3D=
"100%" bgcolor=3D"#fff"><tr><td style=3D"padding: 0;">
                                            <table class=3D"s-text__wrapper=
 sb-full-width" style=3D"border-spacing: 0; font-family: sans-serif; positi=
on: relative; z-index: 2; width: 100%; color: #111;" width=3D"100%"><tr>  <=
td class=3D"s-text__row" style=3D"padding: 14px; font-size: 0; text-align: =
left;" align=3D"left">  <div class=3D"s-text__text-wrapper" style=3D"displa=
y: inline-block; width: 100%; vertical-align: top; max-width: 100%;"><table=
 style=3D"border-spacing: 0; font-family: sans-serif; color: #111;"><tr><td=
 class=3D"s-text__text-cell" style=3D"padding: 10px;"><table class=3D"s-tex=
t__list sb-table-layout-fixed" style=3D"border-spacing: 0; font-family: san=
s-serif; table-layout: fixed; color: #111;">     <tr>  <td class=3D"s-text_=
_item" style=3D"padding: 0;"><!--[if (gte mso 9)|(IE)]> <p class=3D"sb-font=
-p1 sb-break-all sb-align-left" style=3D"margin: 0; font-size: 16px; line-h=
eight: 24px; text-align: left; word-break: break-all;">Dear Author,<br><br>=
You are cordially invited to the 2021 International Conference on Advances =
in Digital Science (ICADS 2021), to be held at Salvador, Brazil, 19 =E2=80=
=93 21 February 2021.<br>ICADS 2021 is an international forum for researche=
rs and practitioners to present and discuss the most recent innovations, tr=
ends, results, experiences and concerns in the several advances of Digital =
Science.&nbsp;<br>Conference website <a href=3D"https://ics.events/icads-20=
21/" target=3D"_blank" class=3D"sb-link" data-link-id=3D"0" style=3D"color:=
 inherit; text-decoration: underline;">https://ics.events/icads-2021/</a>.<=
br>You may submit your paper online via Conference Submission Form on <a hr=
ef=3D"https://ics.events/icads-2021/" target=3D"_blank" class=3D"sb-link" d=
ata-link-id=3D"1" style=3D"color: inherit; text-decoration: underline;">htt=
ps://ics.events/icads-2021/.</a> Submitted papers (until 10-12 page limit) =
must be written in English, must not have been published before, not be und=
er review for any other conference or publication, must comply with Templat=
e in .doc/docx format. <br>All submissions will be twice =C2=ABblind=C2=BB =
reviewed by Scientific Committee Members and invited Reviewers based on rel=
evance, timeliness, originality, importance and clarity of expression with =
convincing argumentative and a strict paper selection process. <br>&nbsp;<b=
r>Accepted and registered Papers will be published in ICADS 2021 Proceeding=
 by <b><font style=3D"color: #c44569;">Springer in a book of the =E2=80=9CA=
dvances in Intelligent Systems and Computing=E2=80=9D (included in Scopus s=
ource list, Q3 / JSR 0,184</font></b>), and then will be submitted to <b><f=
ont style=3D"color: #c44569;">ISI Proceedings, SCOPUS</font></b>, Google Sc=
holar and other indexations.<br>We are prepared to offer virtual participat=
ion options, for anyone who cannot or chooses not to travel due to the situ=
ation regarding COVID-19.<br>Due to the restrictions caused this year by CO=
VID-19 Pandemic, authors with registration in ICCS2020 will have a <b><font=
 style=3D"color: #c44569;">discount of 50 USD</font></b> in the ICADS 2021 =
registration.<br></p> <![endif]--><!--[if !mso]><!-- --> <p class=3D"sb-fon=
t-p1 sb-break-word sb-align-left" style=3D"margin: 0; font-size: 16px; line=
-height: 24px; text-align: left; word-break: break-word;">Dear Author,<br><=
br>You are cordially invited to the 2021 International Conference on Advanc=
es in Digital Science (ICADS 2021), to be held at Salvador, Brazil, 19 =E2=
=80=93 21 February 2021.<br>ICADS 2021 is an international forum for resear=
chers and practitioners to present and discuss the most recent innovations,=
 trends, results, experiences and concerns in the several advances of Digit=
al Science.&nbsp;<br>Conference website <a href=3D"http://email.tb.ru/ru/te=
_link_tracker?hash=3D6wsqdid8i1enrariep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dh=
oop9cuqfrqi4xob588fmihr1fn66wa778d6951prb9n8b377eee9msqjyg7zjza1xaw8x1ernoc=
4r4bbt5k41x5popc6gkb6firqa5reorqy4jz8dd1kgk95yjpz8uhpg3kmrnje6jes3pskzagwyo=
5iyenqjuoi6syy51n5qqbyn6bjj7xpn3f75nwqa1dd4msattq6sqz86d5igtyshb5y&url=3DaH=
R0cHM6Ly9pY3MuZXZlbnRzL2ljYWRzLTIwMjEv&uid=3DMzY3MDQ2MQ~~&ucs=3D40204841c7d=
91b13528a6e7f63010631" target=3D"_blank" class=3D"sb-link" data-link-id=3D"=
0" style=3D"color: inherit; text-decoration: underline;">https://ics.events=
/icads-2021/</a>.<br>You may submit your paper online via Conference Submis=
sion Form on <a href=3D"http://email.tb.ru/ru/te_link_tracker?hash=3D6jafpp=
81mhb9xhriep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihr1fn6=
6wa778d6951prb9n8b377eee9msqjyg7zjza1xaw8x1ernoc4r4bbt5k41x5popc6gkb6firqa5=
reorqy4jz8dd1kgk95yjpz8uhpg3kmrnje6jes3pskzagwyo5iyenqjuoi6syy3udtxnbhfhz78=
pxpn3f75nwqa1dd4msattq6sqz86d5igtyshb5y&url=3DaHR0cHM6Ly9pY3MuZXZlbnRzL2ljY=
WRzLTIwMjEv&uid=3DMzY3MDQ2MQ~~&ucs=3D40204841c7d91b13528a6e7f63010631" targ=
et=3D"_blank" class=3D"sb-link" data-link-id=3D"1" style=3D"color: inherit;=
 text-decoration: underline;">https://ics.events/icads-2021/.</a> Submitted=
 papers (until 10-12 page limit) must be written in English, must not have =
been published before, not be under review for any other conference or publ=
ication, must comply with Template in .doc/docx format. <br>All submissions=
 will be twice =C2=ABblind=C2=BB reviewed by Scientific Committee Members a=
nd invited Reviewers based on relevance, timeliness, originality, importanc=
e and clarity of expression with convincing argumentative and a strict pape=
r selection process. <br>&nbsp;<br>Accepted and registered Papers will be p=
ublished in ICADS 2021 Proceeding by <b><font style=3D"color: #c44569;">Spr=
inger in a book of the =E2=80=9CAdvances in Intelligent Systems and Computi=
ng=E2=80=9D (included in Scopus source list, Q3 / JSR 0,184</font></b>), an=
d then will be submitted to <b><font style=3D"color: #c44569;">ISI Proceedi=
ngs, SCOPUS</font></b>, Google Scholar and other indexations.<br>We are pre=
pared to offer virtual participation options, for anyone who cannot or choo=
ses not to travel due to the situation regarding COVID-19.<br>Due to the re=
strictions caused this year by COVID-19 Pandemic, authors with registration=
 in ICCS2020 will have a <b><font style=3D"color: #c44569;">discount of 50 =
USD</font></b> in the ICADS 2021 registration.<br></p> <!--<![endif]--></td=
></tr>   </table></td></tr></table></div>  </td></tr></table>=20
                                        </td>
                                    </tr>
                                </table>
                                            <table class=3D"sb-block s-adva=
ntages sb-text-dark" style=3D"border-spacing: 0; font-family: sans-serif; p=
osition: relative; width: 100%; max-width: 560px; background-position: 50% =
50%; margin: 0 auto; word-break: break-word; color: #111; background-color:=
 #fff;" cellspacing=3D"0" width=3D"100%" bgcolor=3D"#fff"><tr><td style=3D"=
padding: 0;">
                                            <table class=3D"s-advantages__w=
rapper sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; fon=
t-family: sans-serif; position: relative; z-index: 2; min-height: 48px; wid=
th: 100%; table-layout: fixed; color: #111;" width=3D"100%">  <tr>  <td cla=
ss=3D"s-advantages__heading sb-full-width" style=3D"padding: 24px 24px 20px=
; width: 100%;" width=3D"100%">   <!--[if (gte mso 9)|(IE)]> <p class=3D"s-=
advantages__main-title sb-break-all sb-align-left" style=3D"margin: 0; font=
-size: 28px; line-height: 36px; text-align: left; word-break: break-all;"><=
b><font style=3D"color: #c44569;">Important Dates</font></b></p> <![endif]-=
-><!--[if !mso]><!-- --> <p class=3D"s-advantages__main-title sb-align-left=
" style=3D"margin: 0; font-size: 28px; line-height: 36px; text-align: left;=
"><b><font style=3D"color: #c44569;">Important Dates</font></b></p> <!--<![=
endif]--></td></tr>    <tr>  <td class=3D"s-advantages__row" style=3D"paddi=
ng: 0 20px 24px; font-size: 0; text-align: left;" align=3D"left"><!--[if (g=
te mso 9)|(IE)]>
                                            <table class=3D"sb-full-width s=
b-table-layout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; =
width: 100%; table-layout: fixed; color: #111;" width=3D"100%">
                                                <tr>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                <td width=3D"64" valign=3D"=
top" style=3D"padding: 0;">
                                            <![endif]--><div class=3D"s-adv=
antages__number-wrapper" style=3D"display: inline-block; width: 100%; max-w=
idth: 64px; vertical-align: top;"><table class=3D"sb-full-width sb-table-la=
yout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; width: 100=
%; table-layout: fixed; color: #111;" width=3D"100%"><tr><td class=3D"s-adv=
antages__number-cell" style=3D"padding: 0 4px 4px;"> <p class=3D"s-advantag=
es__number sb-font-arial" style=3D"margin: 0; font-size: 32px; line-height:=
 40px; color: #e3e4e6; white-space: nowrap; overflow: hidden; font-family: =
Arial,sans-serif;">01</p> </td></tr></table></div><!--[if (gte mso 9)|(IE)]=
>
                                                </td>
                                            <![endif]-->   <!--[if (gte mso=
 9)|(IE)]>
                                            <td width=3D"456" valign=3D"top=
" style=3D"padding: 0;">
                                        <![endif]--><div class=3D"s-advanta=
ges__text" style=3D"display: inline-block; width: 100%; max-width: 456px; v=
ertical-align: top;"><table class=3D"sb-full-width" style=3D"border-spacing=
: 0; font-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr=
><td class=3D"s-advantages__text-cell" style=3D"padding: 8px 4px 0;"><table=
 class=3D"sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; =
font-family: sans-serif; width: 100%; table-layout: fixed; color: #111;" wi=
dth=3D"100%">  <tr><td class=3D"s-advantages__text-row" style=3D"padding: 0=
;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-advantages__title sb-break-all =
sb-align-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text=
-align: left; word-break: break-all;">Submission: 	November 01, 2020</p> <!=
[endif]--><!--[if !mso]><!-- --> <p class=3D"s-advantages__title sb-align-l=
eft" style=3D"margin: 0; font-size: 20px; line-height: 28px; text-align: le=
ft;">Submission: 	November 01, 2020</p> <!--<![endif]--></td></tr>   <tr><t=
d class=3D"s-advantages__text-row  s-advantages__text-row_with-padding" sty=
le=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(IE)]> <p class=3D=
"s-advantages__subtitle sb-font-p2 sb-break-all sb-align-left" style=3D"mar=
gin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-align: lef=
t; word-break: break-all;"></p> <![endif]--><!--[if !mso]><!-- --> <p class=
=3D"s-advantages__subtitle sb-font-p2 sb-align-left" style=3D"margin: 0; co=
lor: #959ba4; font-size: 14px; line-height: 20px; text-align: left;"></p> <=
!--<![endif]--></td></tr>  </table></td></tr></table></div><!--[if (gte mso=
 9)|(IE)]>
                                            </td>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                </tr>
                                            </table>
                                        <![endif]--></td></tr>  <tr>  <td c=
lass=3D"s-advantages__row" style=3D"padding: 0 20px 24px; font-size: 0; tex=
t-align: left;" align=3D"left"><!--[if (gte mso 9)|(IE)]>
                                            <table class=3D"sb-full-width s=
b-table-layout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; =
width: 100%; table-layout: fixed; color: #111;" width=3D"100%">
                                                <tr>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                <td width=3D"64" valign=3D"=
top" style=3D"padding: 0;">
                                            <![endif]--><div class=3D"s-adv=
antages__number-wrapper" style=3D"display: inline-block; width: 100%; max-w=
idth: 64px; vertical-align: top;"><table class=3D"sb-full-width sb-table-la=
yout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; width: 100=
%; table-layout: fixed; color: #111;" width=3D"100%"><tr><td class=3D"s-adv=
antages__number-cell" style=3D"padding: 0 4px 4px;"> <p class=3D"s-advantag=
es__number sb-font-arial" style=3D"margin: 0; font-size: 32px; line-height:=
 40px; color: #e3e4e6; white-space: nowrap; overflow: hidden; font-family: =
Arial,sans-serif;">02</p> </td></tr></table></div><!--[if (gte mso 9)|(IE)]=
>
                                                </td>
                                            <![endif]-->   <!--[if (gte mso=
 9)|(IE)]>
                                            <td width=3D"456" valign=3D"top=
" style=3D"padding: 0;">
                                        <![endif]--><div class=3D"s-advanta=
ges__text" style=3D"display: inline-block; width: 100%; max-width: 456px; v=
ertical-align: top;"><table class=3D"sb-full-width" style=3D"border-spacing=
: 0; font-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr=
><td class=3D"s-advantages__text-cell" style=3D"padding: 8px 4px 0;"><table=
 class=3D"sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; =
font-family: sans-serif; width: 100%; table-layout: fixed; color: #111;" wi=
dth=3D"100%">  <tr><td class=3D"s-advantages__text-row" style=3D"padding: 0=
;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-advantages__title sb-break-all =
sb-align-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text=
-align: left; word-break: break-all;">Notification: 	December 11, 2020</p> =
<![endif]--><!--[if !mso]><!-- --> <p class=3D"s-advantages__title sb-align=
-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text-align: =
left;">Notification: 	December 11, 2020</p> <!--<![endif]--></td></tr>   <t=
r><td class=3D"s-advantages__text-row  s-advantages__text-row_with-padding"=
 style=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(IE)]> <p clas=
s=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-align-left" style=3D=
"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-align:=
 left; word-break: break-all;"></p> <![endif]--><!--[if !mso]><!-- --> <p c=
lass=3D"s-advantages__subtitle sb-font-p2 sb-align-left" style=3D"margin: 0=
; color: #959ba4; font-size: 14px; line-height: 20px; text-align: left;"></=
p> <!--<![endif]--></td></tr>  </table></td></tr></table></div><!--[if (gte=
 mso 9)|(IE)]>
                                            </td>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                </tr>
                                            </table>
                                        <![endif]--></td></tr>  <tr>  <td c=
lass=3D"s-advantages__row" style=3D"padding: 0 20px 24px; font-size: 0; tex=
t-align: left;" align=3D"left"><!--[if (gte mso 9)|(IE)]>
                                            <table class=3D"sb-full-width s=
b-table-layout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; =
width: 100%; table-layout: fixed; color: #111;" width=3D"100%">
                                                <tr>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                <td width=3D"64" valign=3D"=
top" style=3D"padding: 0;">
                                            <![endif]--><div class=3D"s-adv=
antages__number-wrapper" style=3D"display: inline-block; width: 100%; max-w=
idth: 64px; vertical-align: top;"><table class=3D"sb-full-width sb-table-la=
yout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; width: 100=
%; table-layout: fixed; color: #111;" width=3D"100%"><tr><td class=3D"s-adv=
antages__number-cell" style=3D"padding: 0 4px 4px;"> <p class=3D"s-advantag=
es__number sb-font-arial" style=3D"margin: 0; font-size: 32px; line-height:=
 40px; color: #e3e4e6; white-space: nowrap; overflow: hidden; font-family: =
Arial,sans-serif;">03</p> </td></tr></table></div><!--[if (gte mso 9)|(IE)]=
>
                                                </td>
                                            <![endif]-->   <!--[if (gte mso=
 9)|(IE)]>
                                            <td width=3D"456" valign=3D"top=
" style=3D"padding: 0;">
                                        <![endif]--><div class=3D"s-advanta=
ges__text" style=3D"display: inline-block; width: 100%; max-width: 456px; v=
ertical-align: top;"><table class=3D"sb-full-width" style=3D"border-spacing=
: 0; font-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr=
><td class=3D"s-advantages__text-cell" style=3D"padding: 8px 4px 0;"><table=
 class=3D"sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; =
font-family: sans-serif; width: 100%; table-layout: fixed; color: #111;" wi=
dth=3D"100%">  <tr><td class=3D"s-advantages__text-row" style=3D"padding: 0=
;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-advantages__title sb-break-all =
sb-align-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text=
-align: left; word-break: break-all;">Registration:	December 21, 2020</p> <=
![endif]--><!--[if !mso]><!-- --> <p class=3D"s-advantages__title sb-align-=
left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text-align: l=
eft;">Registration:	December 21, 2020</p> <!--<![endif]--></td></tr>   <tr>=
<td class=3D"s-advantages__text-row  s-advantages__text-row_with-padding" s=
tyle=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(IE)]> <p class=
=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-align-left" style=3D"=
margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-align: =
left; word-break: break-all;"><a href=3D"https://ics.events/" target=3D"_bl=
ank" class=3D"sb-link" data-link-id=3D"0" style=3D"color: inherit; text-dec=
oration: underline;">ICADS CONVENER</a></p> <![endif]--><!--[if !mso]><!-- =
--> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left" style=3D"m=
argin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-align: l=
eft;"><a href=3D"http://email.tb.ru/ru/te_link_tracker?hash=3D6hht9zehcjq5a=
qriep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihr1fn66wa778d=
6951prb9n8b377eee9msqjyg7zjza1xaw8x1ernoc4r4bbt5k41x5popc6gkb6firqa5reorqy4=
jz8dd1kgk95yjpz8uhpg3kmrnje6jes3pskzagwyo5iyenqjuoi6syya8q7ddiu488kmidprr84=
p8144yud4msattq6sqz86d5igtyshb5y&url=3DaHR0cHM6Ly9pY3MuZXZlbnRzLw~~&uid=3DM=
zY3MDQ2MQ~~&ucs=3D1a6945d0b69c851b75d9dba64ec3e229" target=3D"_blank" class=
=3D"sb-link" data-link-id=3D"0" style=3D"color: inherit; text-decoration: u=
nderline;">ICADS CONVENER</a></p> <!--<![endif]--></td></tr>  </table></td>=
</tr></table></div><!--[if (gte mso 9)|(IE)]>
                                            </td>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                </tr>
                                            </table>
                                        <![endif]--></td></tr>   </table>=
=20
                                        </td>
                                    </tr>
                                </table>
                                        <!--[if (gte mso 9)|(IE)]>
                        </td>
                    </tr>
                </table>
            <![endif]-->
        </div>
    </center>
<table bgcolor=3D"white" align=3D"center" width=3D"100%"><tr><td align=3D"c=
enter">
 <span style=3D"font-family: arial,helvetica,sans-serif; color: black; font=
-size: 12px;">
  =D0=AD=D1=82=D0=BE =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5=
 =D0=B1=D1=8B=D0=BB=D0=BE =D0=BE=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=
=D0=BD=D0=BE jailhouse-dev@googlegroups.com =D0=BE=D1=82: <br/>
    Tatiana Antipova | conf@ics.events <br/>
    <a href=3D"http://email.tb.ru/ru/te_unsubscribe?hash=3D653h6t4egyjnn1nq=
4nktinga1955tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihr1fn66wa778d695=
1prb9n8b377eee9msqjyg7zjza1xaw8x1ernoc4r4bbt5k41x5popc6gkb6firqa5reorqy4jz8=
dd1kgk95yjpz8uhpg3kmrnje6jes3pskzagwyo5iyenqjuoi6syy4cejjiu6jxwi144tz7gseow=
wintax1t59e3ahjtk8yp45nicm3nge4d43beo9cg7mr44q8rp3h3qxhq7sgjxzgxim7c71z1dp6=
ocwbf96rk8n3togxocrocycj4ohhrr3czpxgz9m1mmbbzwi59hjyme58pdwzficwbdkwzdr8pmx=
3njbmpj3wm6c1aujqm1a" style=3D"color: black;">=D0=9E=D1=82=D0=BF=D0=B8=D1=
=81=D0=B0=D1=82=D1=8C=D1=81=D1=8F =D0=BE=D1=82 =D1=80=D0=B0=D1=81=D1=81=D1=
=8B=D0=BB=D0=BA=D0=B8</a>
 </span>
</td></tr></table><center><table><tr><td><img src=3D"https://email.tb.ru/ru=
/te_read_tracker/3670461?hash=3D6hiyst7fyntgctpqa78tagai94u5tf96h5x58wx7ksh=
zfpnytry4dhoop9cuqfrqi4xob588fmihr1fn66wa778d6951prb9n8b377eee9msqjyg7zjza1=
xaw8x1ernoc4r4bbt5k41x5popc6gkb6firqa5reorqy4jz8dd1kgk95yjpz8uhpg3kmrnje6je=
s3pskzagwyo5iyenqjuoi6syyacfsjwu35cmba3gk881eyezhd6y" width=3D"1" height=3D=
"1" alt=3D"" title=3D"" border=3D"0"></td></tr></table></center></body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/E1k7DhB-Dsy4rA-ML%40ucs102-ucs-7.msgpanel.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/E1k7DhB-Dsy4rA-ML%40ucs102-ucs-7.msgpanel.com</a>.<br />

------=_Part_245391_1303982550.1597565233482--

--MWs3RGhCLURzeTRyQS1NTA==--
