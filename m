Return-Path: <jailhouse-dev+bncBDNMNFUARYIBB7WFVSVQMGQEF43IVVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3b.google.com (mail-oa1-x3b.google.com [IPv6:2001:4860:4864:20::3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 59387801C8B
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Dec 2023 13:28:48 +0100 (CET)
Received: by mail-oa1-x3b.google.com with SMTP id 586e51a60fabf-1fadd5ea2cesf1305390fac.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 02 Dec 2023 04:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701520126; x=1702124926; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6bgjYIWjmMvPe9Utx6aO9qt0SH6XMV+RE/iGdAarU8=;
        b=hJiB/t7fayfX6FPZ9d1zA2578FqHUA2s12OY7ctwjuqRYOFqEGO/BHTdg5iOadCuha
         vbhYrU4m0XP78jxJBREkKuzqTirkOhcF++Jp78C7By8Fp7IZnpsHfmyuTJNs0XCUekh3
         4TLRukNbjp/35j8K1Fi7Ue2E+sDcJCEn+TfuxcvupPHJDwhRTUCjamENURzFk7ofwxpK
         7BhIpykJ8WWGW6iHxAXUF/EfpoamYI/b5OtCiDQ+j0jr9R+3009Tj6pbnMsSGzmQbQRp
         h3TQpV4Zu6RItN8a8fAOomAx8FKkRUa/Fg6Gl7lU04RHI7WsYJf+ZWpkefZ5cZVxMwVi
         jMrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701520126; x=1702124926; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6bgjYIWjmMvPe9Utx6aO9qt0SH6XMV+RE/iGdAarU8=;
        b=gsDIG0NOZj8DpBHJ/slFPH/8WZI9uO0yuGUdekzd3mMOivZ9U03ZxgXjjzu7lDSrcX
         c2aYm88D9YGjiCK5mJDJqcsdqr6b0+n+56+zwoVAbZE0JM59fQbHXUUOBWB3nchVEmBz
         OpPX2QHHxtX4G4j13bV8W0+y1phl7OKfmVSJ8xF0dskEDRZS1BjoNS01oVUh9WxA7jDV
         RkBOiiCzZJqshRjNx/GRB7+3ooDA1+KMG6qOvHulz3G0ecybRilpqz+Z817ZZyntKkXB
         ZjUGFJ68dPyzfo7Wxx/jWn19jv9fjOrA5yqTCeHVBR43nhcryVzzTttEsfo+X9u9rouG
         dv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701520126; x=1702124926;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6bgjYIWjmMvPe9Utx6aO9qt0SH6XMV+RE/iGdAarU8=;
        b=gKHA9glxqfo4JvSoM2a/Shk5i2prHCB8WZcz/V9UZn7dgjAMgS7JathCK75GAWuy6r
         uwhybcnmQVls0wtuFWn1rrKIuhqmkQ87nImHToaLbiBbr75Ax4uKYLDFVin2B3MV5xng
         WDcD7BSXDIvOGt6PVJGHjBbX0HieLtVQIFi9g98BFE4PJZTZ17QPcYM+4U5LT806Vnc6
         XGCd7EihmMh3Ek/EqDktB69gZt3PX9BEAgcLy08vVJSvgjMeV1uH8B/JlexOY5CNIk0E
         eqU+TLL7w+LtZVTxR0vRatGhzCQubnWW7umbNiU2YVePobO9JQXgGOSRcw+HwHD8YYoa
         z8mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxEp2tN9VrnCJJAbe6sAjQQG1Nec9B78vhVjnCB242zc0oLEWUD
	0WQjha3fc5MWwrK0QHcTBsc=
X-Google-Smtp-Source: AGHT+IH56TNInrAKa+1zLur5lD6qglWR3P49UZOVvME9N6g9g/SFYAgHHG+Rpl/mB86Fd9sW0BCgVA==
X-Received: by 2002:a05:6870:2b1a:b0:1fb:788:e8b5 with SMTP id ld26-20020a0568702b1a00b001fb0788e8b5mr500285oab.48.1701520126609;
        Sat, 02 Dec 2023 04:28:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:f602:b0:1fa:4e81:9897 with SMTP id
 ek2-20020a056870f60200b001fa4e819897ls1752106oab.1.-pod-prod-01-us; Sat, 02
 Dec 2023 04:28:45 -0800 (PST)
X-Received: by 2002:a05:6870:1aaa:b0:1f0:15e3:11a5 with SMTP id ef42-20020a0568701aaa00b001f015e311a5mr1115184oab.10.1701520125195;
        Sat, 02 Dec 2023 04:28:45 -0800 (PST)
Date: Sat, 2 Dec 2023 04:28:44 -0800 (PST)
From: Yvone Brem <bremyvone@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0364d518-39a2-4509-82b0-20a41d8f5833n@googlegroups.com>
Subject: Virality Download] [pack]
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_63576_820285603.1701520124311"
X-Original-Sender: bremyvone@gmail.com
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

------=_Part_63576_820285603.1701520124311
Content-Type: multipart/alternative; 
	boundary="----=_Part_63577_716012467.1701520124311"

------=_Part_63577_716012467.1701520124311
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Note: If you have the Click-to-Run version of Office installed, you will be=
=20
prompted to update automatically to the SP1 version. There is no need to=20
install an update using one of the methods below, which only apply to a=20
Windows Installer-based (MSI) installation.

Note Before you install these service packs, you should make sure that you=
=20
have sufficient disk space. For caching, the packages may require up to=20
four times their file size in remaining disk space during installation.

Microsoft UpdateYou can opt in a computer to the Microsoft Update service,=
=20
and then register that service with the Automatic updates to receive the=20
SP1 update. Microsoft Update will detect which products that you have=20
installed, and then apply all updates to the products.

Note On Microsoft Update, this service pack is included in KB 2850036.
Virality Download] [pack]

*Download File* https://dempdomexku.blogspot.com/?download=3D2wHxeC


The following files are available for download from the Microsoft Download=
=20
Center.

Note If you have a 32-bit version of Office 2013 installed on a 64-bit=20
version of Windows, you should install the Office 2013 SP1 32-bit package.

119591 How to obtain Microsoft support files from online services Microsoft=
=20
scanned this file for viruses. Microsoft used the most current=20
virus-detection software that was available on the date that the file was=
=20
posted. The file is stored on security-enhanced servers that help prevent=
=20
any unauthorized changes to the file.=20

For more information about a complete list of all released SP1 desktop=20
packages, click the following article number to view the article in the=20
Microsoft Knowledge Base:

Monday's revelation comes months after multiple reports of reported Jet=20
Pack Man sightings made rounds on social media. The LAX mystery first=20
captured the Internet's attention in late August of 2020 after an American=
=20
Airlines pilot reported "seeing a mystery person in a jetpack flying in the=
=20
path of incoming jets."

*"The FBI has worked closely with the FAA to investigate reported jetpack=
=20
sightings in the Los Angeles area, none of which have been verified. One=20
working theory is that pilots might have seen balloons."*

Once downloaded, ViromeScan locally processes the metagenome for searching=
=20
eukaryotic viral sequences. Input files should be single-end or paired-end=
=20
reads in fastq format (for paired-end reads compressed files in gzip, bzip2=
=20
and zip formats are also accepted) retrieved from shotgun sequencing or=20
RNA-seq. Depending on the research strategy, ViromeScan gives users the=20
option to choose from a range of in-house built reference databases,=20
including human DNA virus database, human DNA/RNA virus database,=20
eukaryotic DNA virus database and eukaryotic DNA/RNA virus database. The=20
human virus databases contain only viruses that have the human being as the=
=20
natural host; on the other hand, the eukaryotic virus databases also=20
include viruses for vertebrates, invertebrates, fungi, algae and plants,=20
while excluding bacteriophages. All databases are based on the complete=20
viral genomes available on the NCBI website [23]. The NCBI IDs of the viral=
=20
genomes used to build the different databases are reported in Additional=20
file 1.

Believe it or not, you can get an icon pack for your phone and it will=20
completely transform the home screen and many other parts of the UI. These=
=20
packs are collections of icons that usually share similar aesthetics. Some=
=20
icon packs only modify a handful of apps designed by the OEMs, but for a=20
complete makeover, third party icon packs from the Play Store are your best=
=20
option. With these, you can change the majority of the apps installed on=20
your device.

Sadly, the Pixel Launcher doesn't support custom icon packs. If you're=20
rooted, you can change the icons using the mod at the link below.=20
Otherwise, you can get a custom launcher without root and apply an icon=20
pack to that.

LG has its own theme store where you can make a few cosmetic changes,=20
including the icon pack. Long press any empty space on the home screen and=
=20
select "Wallpaper & theme." Select "Icon" along the bottom and choose an=20
icon pack. Select "Download," and after a few seconds, choose "Apply" to=20
add the icons.

Note that LG's default launcher doesn't support third-party icon packs, and=
=20
the collection found in the theme store usually only changes LG-developed=
=20
apps. If you're not okay with these limitations, you can apply icon packs=
=20
to a custom launcher.

OnePlus' default launcher supports third-party icon packs. So install an=20
icon pack you like from the Play Store, then long-press any empty space on=
=20
the home screen and choose "Home Settings." Select "Icon pack" and choose=
=20
the set of icons from the list. Use the back arrow to return to the home=20
screen.

For Samsung devices, applying third-party icons to the default home screen=
=20
is limited to icon packs installed through Galaxy Themes (you are not=20
allowed to use third-party icons from the Play Store). However, you can=20
install any icon pack if you're using a custom launcher.

But if you want to stick with the stock home screen app, long press any=20
empty space on the home screen and choose "Theme." Choose "Icon" and=20
download any icon pack from the list. Once installed, tap the "Apply"=20
button to change your home screen icons.

If you decide to use Nova Launcher, after installing any third-party icon=
=20
pack from the Play Store, long press an empty space on your home screen.=20
Select "Settings," then choose "Look & feel." Choose "Icon style" then=20
"Icon theme." Select the icon pack from the list and return to the home=20
screen to see the change.

If you prefer to use Action Launcher, the process is straightforward as=20
well. Install an icon pack from the Play Store, long-press the home screen,=
=20
then choose "Home settings." Select "Appearance," then "Icon pack," and=20
choose your icon pack, then press "OK."

The app's newest feature allows users to upload ten or more images to be=20
reimagined into various art styles. Lensa AI technology utilizes neural=20
network Stable Diffusion to create 50 unique portraits, which users can=20
download for $7.99. The virality of the portraits helped the app reach the=
=20
top of the iOS App Store's "Photo & Video" category earlier this month.

Double-stranded DNA bacteriophages package their genome at high pressure=20
inside a procapsid through the portal, an oligomeric ring protein located=
=20
at a unique capsid vertex. Once the DNA has been packaged, the tail=20
components assemble on the portal to render the mature infective virion.=20
The tail tightly seals the ejection conduit until infection, when its=20
interaction with the host membrane triggers the opening of the channel and=
=20
the viral genome is delivered to the host cell. Using high-resolution=20
cryo-electron microscopy and X-ray crystallography, here we describe=20
various structures of the T7 bacteriophage portal and fiber-less tail=20
complex, which suggest a possible mechanism for DNA retention and ejection:=
=20
a portal closed conformation temporarily retains the genome before the tail=
=20
is assembled, whereas an open portal is found in the tail. Moreover, a fold=
=20
including a seven-bladed =CE=B2-propeller domain is described for the nozzl=
e=20
tail protein.

The order *Caudovirales* comprises the largest number of biological=20
entities on Earth. They are bacterial viruses characterized by an=20
icosahedral capsid, enclosing a double-stranded (ds) DNA, with a tail.=20
These phages share a common assembly pathway of prohead formation and=20
genome packaging with herpesviruses1,2,3. Mechanisms for DNA incorporation=
=20
and ejection show a number of similarities based on the existence of a=20
machinery built by several components, including the portal protein or=20
head-to-tail connector, motor proteins that provide energy-dependent DNA=20
translocation (terminases)4, and, in phages, the tail complex5. In the case=
=20
of the *Podoviridae* family, bacteriophages have a short, non-contractile=
=20
tail, which generally comprises an adaptor and a tubular nozzle or knob,=20
with a plug to prevent DNA leakage. The other tail components are the=20
fibers (or spikes), which are responsible mainly for bacterial receptor=20
recognition6,7.

Phage portal proteins are key viral components located in a single=20
pentameric vertex of the capsid and they act as initiators of capsid=20
assembly. They are also critical components of the DNA-packaging complex=20
and are involved in tail assembly1,2,8. In spite of a lack of extensive=20
sequence similarity, all portal structures solved to date for *Caudovirales=
*=20
(phi299,10; SPP111; P2212; T413) share common morphological features,=20
including a conical channel along the longitudinal axis and a conspicuous=
=20
ring made of 12 subunits1,2,8.

DNA packaging into preformed proheads requires the interaction of the=20
portal protein with the terminase, which generates forces involved in the=
=20
processive translocation of dsDNA into the viral capsid, where it is stored=
=20
at quasi-crystalline concentration1,14,15. Both in phages16,17,18 and in=20
herpesviruses19, the interaction of the packaging terminase occurs at a=20
region of the portal protein that extends outside the capsid shell through=
=20
the portal vertex. After completion of the packaging, the DNA stored inside=
=20
the capsid undergoes considerable stress due to mechanical strain induced=
=20
by bending, as well as extensive repulsive electrostatic=20
interactions20,21,22. In phi29 and SPP1, the DNA interacts with positively=
=20
charged residues in the central channel of the portal protein, which have=
=20
been proposed to contribute to stabilize the DNA inside the capsid prior to=
=20
tail assembly9,22,23.

All together, our results allow us to propose a model for the roles of each=
=20
tail protein during T7 bacteriophage DNA packaging, retention, and ejection=
=20
(Fig. 6b). From a methodological point of view, this work illustrates the=
=20
power of the correlative combination of X-ray crystallography and cryo-EM=
=20
techniques, in order to solve challenging molecular structures.

Bimber is a *viral magazine theme*, that lets you launch a fully functional=
 *viral=20
site in no more than 24 hours*. It comes with powerful sharing buttons;=20
popular, hot, trending listings and multiple ad locations. Everything in a=
=20
lightweight and easy-to-use package. Just start today and *go viral today!*
eebf2c3492

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0364d518-39a2-4509-82b0-20a41d8f5833n%40googlegroups.com.

------=_Part_63577_716012467.1701520124311
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p>Note: If you have the Click-to-Run version of Office installed, you=
 will be prompted to update automatically to the SP1 version. There is no n=
eed to install an update using one of the methods below, which only apply t=
o a Windows Installer-based (MSI) installation.<br><br>Note Before you inst=
all these service packs, you should make sure that you have sufficient disk=
 space. For caching, the packages may require up to four times their file s=
ize in remaining disk space during installation.</p></div><div><p>Microsoft=
 UpdateYou can opt in a computer to the Microsoft Update service, and then =
register that service with the Automatic updates to receive the SP1 update.=
 Microsoft Update will detect which products that you have installed, and t=
hen apply all updates to the products.<br><br>Note On Microsoft Update, thi=
s service pack is included in KB 2850036.</p></div><div></div><div><h2>Vira=
lity Download] [pack]</h2><br /><p><b>Download File</b> https://dempdomexku=
.blogspot.com/?download=3D2wHxeC</p><br /><br /></div><div><p>The following=
 files are available for download from the Microsoft Download Center.<br><b=
r>Note If you have a 32-bit version of Office 2013 installed on a 64-bit ve=
rsion of Windows, you should install the Office 2013 SP1 32-bit package.</p=
></div><div><p>119591 How to obtain Microsoft support files from online ser=
vices Microsoft scanned this file for viruses. Microsoft used the most curr=
ent virus-detection software that was available on the date that the file w=
as posted. The file is stored on security-enhanced servers that help preven=
t any unauthorized changes to the file. <br><br> For more information about=
 a complete list of all released SP1 desktop packages, click the following =
article number to view the article in the Microsoft Knowledge Base:</p></di=
v><div><p>Monday&apos;s revelation comes months after multiple reports of r=
eported Jet Pack Man sightings made rounds on social media. The LAX mystery=
 first captured the Internet&apos;s attention in late August of 2020 after =
an American Airlines pilot reported "seeing a mystery person in a jetpack f=
lying in the path of incoming jets."</p></div><div><p><i>"The FBI has worke=
d closely with the FAA to investigate reported jetpack sightings in the Los=
 Angeles area, none of which have been verified. One working theory is that=
 pilots might have seen balloons."</i></p></div><div><p>Once downloaded, Vi=
romeScan locally processes the metagenome for searching eukaryotic viral se=
quences. Input files should be single-end or paired-end reads in fastq form=
at (for paired-end reads compressed files in gzip, bzip2 and zip formats ar=
e also accepted) retrieved from shotgun sequencing or RNA-seq. Depending on=
 the research strategy, ViromeScan gives users the option to choose from a =
range of in-house built reference databases, including human DNA virus data=
base, human DNA/RNA virus database, eukaryotic DNA virus database and eukar=
yotic DNA/RNA virus database. The human virus databases contain only viruse=
s that have the human being as the natural host; on the other hand, the euk=
aryotic virus databases also include viruses for vertebrates, invertebrates=
, fungi, algae and plants, while excluding bacteriophages. All databases ar=
e based on the complete viral genomes available on the NCBI website [23]. T=
he NCBI IDs of the viral genomes used to build the different databases are =
reported in Additional file 1.</p></div><div><p>Believe it or not, you can =
get an icon pack for your phone and it will completely transform the home s=
creen and many other parts of the UI. These packs are collections of icons =
that usually share similar aesthetics. Some icon packs only modify a handfu=
l of apps designed by the OEMs, but for a complete makeover, third party ic=
on packs from the Play Store are your best option. With these, you can chan=
ge the majority of the apps installed on your device.</p></div><div></div><=
div><p></p></div><div><p>Sadly, the Pixel Launcher doesn't support custom i=
con packs. If you're rooted, you can change the icons using the mod at the =
link below. Otherwise, you can get a custom launcher without root and apply=
 an icon pack to that.</p></div><div><p>LG has its own theme store where yo=
u can make a few cosmetic changes, including the icon pack. Long press any =
empty space on the home screen and select "Wallpaper & theme." Select "Icon=
" along the bottom and choose an icon pack. Select "Download," and after a =
few seconds, choose "Apply" to add the icons.</p></div><div><p>Note that LG=
's default launcher doesn't support third-party icon packs, and the collect=
ion found in the theme store usually only changes LG-developed apps. If you=
're not okay with these limitations, you can apply icon packs to a custom l=
auncher.</p></div><div><p>OnePlus' default launcher supports third-party ic=
on packs. So install an icon pack you like from the Play Store, then long-p=
ress any empty space on the home screen and choose "Home Settings." Select =
"Icon pack" and choose the set of icons from the list. Use the back arrow t=
o return to the home screen.</p></div><div><p>For Samsung devices, applying=
 third-party icons to the default home screen is limited to icon packs inst=
alled through Galaxy Themes (you are not allowed to use third-party icons f=
rom the Play Store). However, you can install any icon pack if you're using=
 a custom launcher.</p></div><div><p>But if you want to stick with the stoc=
k home screen app, long press any empty space on the home screen and choose=
 "Theme." Choose "Icon" and download any icon pack from the list. Once inst=
alled, tap the "Apply" button to change your home screen icons.</p></div><d=
iv><p>If you decide to use Nova Launcher, after installing any third-party =
icon pack from the Play Store, long press an empty space on your home scree=
n. Select "Settings," then choose "Look & feel." Choose "Icon style" then "=
Icon theme." Select the icon pack from the list and return to the home scre=
en to see the change.</p></div><div><p>If you prefer to use Action Launcher=
, the process is straightforward as well. Install an icon pack from the Pla=
y Store, long-press the home screen, then choose "Home settings." Select "A=
ppearance," then "Icon pack," and choose your icon pack, then press "OK."</=
p></div><div><p>The app's newest feature allows users to upload ten or more=
 images to be reimagined into various art styles. Lensa AI technology utili=
zes neural network Stable Diffusion to create 50 unique portraits, which us=
ers can download for $7.99. The virality of the portraits helped the app re=
ach the top of the iOS App Store's "Photo & Video" category earlier this mo=
nth.</p></div><div><p>Double-stranded DNA bacteriophages package their geno=
me at high pressure inside a procapsid through the portal, an oligomeric ri=
ng protein located at a unique capsid vertex. Once the DNA has been package=
d, the tail components assemble on the portal to render the mature infectiv=
e virion. The tail tightly seals the ejection conduit until infection, when=
 its interaction with the host membrane triggers the opening of the channel=
 and the viral genome is delivered to the host cell. Using high-resolution =
cryo-electron microscopy and X-ray crystallography, here we describe variou=
s structures of the T7 bacteriophage portal and fiber-less tail complex, wh=
ich suggest a possible mechanism for DNA retention and ejection: a portal c=
losed conformation temporarily retains the genome before the tail is assemb=
led, whereas an open portal is found in the tail. Moreover, a fold includin=
g a seven-bladed =CE=B2-propeller domain is described for the nozzle tail p=
rotein.</p></div><div><p>The order <i>Caudovirales</i> comprises the larges=
t number of biological entities on Earth. They are bacterial viruses charac=
terized by an icosahedral capsid, enclosing a double-stranded (ds) DNA, wit=
h a tail. These phages share a common assembly pathway of prohead formation=
 and genome packaging with herpesviruses1,2,3. Mechanisms for DNA incorpora=
tion and ejection show a number of similarities based on the existence of a=
 machinery built by several components, including the portal protein or hea=
d-to-tail connector, motor proteins that provide energy-dependent DNA trans=
location (terminases)4, and, in phages, the tail complex5. In the case of t=
he <i>Podoviridae</i> family, bacteriophages have a short, non-contractile =
tail, which generally comprises an adaptor and a tubular nozzle or knob, wi=
th a plug to prevent DNA leakage. The other tail components are the fibers =
(or spikes), which are responsible mainly for bacterial receptor recognitio=
n6,7.</p></div><div><p>Phage portal proteins are key viral components locat=
ed in a single pentameric vertex of the capsid and they act as initiators o=
f capsid assembly. They are also critical components of the DNA-packaging c=
omplex and are involved in tail assembly1,2,8. In spite of a lack of extens=
ive sequence similarity, all portal structures solved to date for <i>Caudov=
irales</i> (phi299,10; SPP111; P2212; T413) share common morphological feat=
ures, including a conical channel along the longitudinal axis and a conspic=
uous ring made of 12 subunits1,2,8.</p></div><div><p>DNA packaging into pre=
formed proheads requires the interaction of the portal protein with the ter=
minase, which generates forces involved in the processive translocation of =
dsDNA into the viral capsid, where it is stored at quasi-crystalline concen=
tration1,14,15. Both in phages16,17,18 and in herpesviruses19, the interact=
ion of the packaging terminase occurs at a region of the portal protein tha=
t extends outside the capsid shell through the portal vertex. After complet=
ion of the packaging, the DNA stored inside the capsid undergoes considerab=
le stress due to mechanical strain induced by bending, as well as extensive=
 repulsive electrostatic interactions20,21,22. In phi29 and SPP1, the DNA i=
nteracts with positively charged residues in the central channel of the por=
tal protein, which have been proposed to contribute to stabilize the DNA in=
side the capsid prior to tail assembly9,22,23.</p></div><div><p>All togethe=
r, our results allow us to propose a model for the roles of each tail prote=
in during T7 bacteriophage DNA packaging, retention, and ejection (Fig. 6b)=
. From a methodological point of view, this work illustrates the power of t=
he correlative combination of X-ray crystallography and cryo-EM techniques,=
 in order to solve challenging molecular structures.</p></div><div><p>Bimbe=
r is a <strong>viral magazine theme</strong>, that lets you launch a fully =
functional <strong>viral site in no more than 24 hours</strong>. It comes w=
ith powerful sharing buttons; popular, hot, trending listings and multiple =
ad locations. Everything in a lightweight and easy-to-use package. Just sta=
rt today and <strong>go viral today!</strong></p> eebf2c3492</div><div></di=
v><div></div><div></div><div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0364d518-39a2-4509-82b0-20a41d8f5833n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0364d518-39a2-4509-82b0-20a41d8f5833n%40googlegroups.co=
m</a>.<br />

------=_Part_63577_716012467.1701520124311--

------=_Part_63576_820285603.1701520124311--
